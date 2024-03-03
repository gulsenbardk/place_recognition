
#include "place_recognition.h"
#include <filesystem>

namespace ipb {

// void
void PlaceRecognitionApplication(const std::filesystem::path &images_path,
                                 int size, int max_iter, int searched_image_ind,
                                 const std::filesystem::path &html_path) {
  if (!filesystem::exists(images_path)) {
    std::cerr << "Error: image database doesn't exist!" << std::endl;
    std::filesystem::directory_iterator it(images_path);
    std::filesystem::directory_iterator end;
    size_t size = std::distance(it, end);
    if (size == 0) {
      std::cerr << "Error: there are no image to proceed!" << std::endl;
    }
  }
  BowDictionary &bows = BowDictionary::GetInstance();

  bows.set_max_iterations(max_iter);
  bows.set_size(size);

  if (!filesystem::exists(images_path.parent_path().parent_path() / "bin")) {
    ipb::serialization::sifts::ConvertDataset(images_path);
  }

  std::filesystem::path descriptors_path =
      images_path.parent_path().parent_path() / "bin";

  std::vector<cv::Mat> load_descriptors =
      ipb::serialization::sifts::LoadDataset((descriptors_path));
  bows.set_descriptors(load_descriptors);

  std::filesystem::path vocabulary_path =
      images_path.parent_path().parent_path() / "vocabulary.bin";

  try {
    if (!filesystem::exists(vocabulary_path)) {
      cv::Mat cluster_centers =
          kMeans(bows.descriptors(), bows.size(), bows.max_iterations());
      bows.set_centeroids(cluster_centers);
      bows.serialize(bows.centroids, vocabulary_path);
      std::cerr << "Vocabulary computed, please run it again to get HTML!"
                << std::endl;
      EXIT_FAILURE;
    }
  } catch (...) {
  }
  bows.deserialize(vocabulary_path);
  std::filesystem::directory_iterator iter(images_path);

  std::vector<ipb::Image> images;
  for (size_t i = 0; i < bows.descriptors().size(); i++) {
    cv::Mat hist_ = ipb::histogram(bows.descriptors()[i], bows.output_mat);
    ipb::Image image;
    image.descriptor = bows.descriptors()[i];
    image.histogram = hist_;
    image.index = i;
    filesystem::directory_entry entry = *iter;
    image.image_path = entry;
    iter++;
    images.push_back(image);
  }

  std::vector<ipb::Image> scored_images;
  ipb::Image searched_image = images[searched_image_ind];

  for (ipb::Image image : images) {

    ipb::Image image_;
    image_.cost = compareHist(searched_image.histogram, image.histogram,
                              // HISTCMP_BHATTACHARYYA);
                              HISTCMP_INTERSECT);
    // searched_image.histogram.dot(image.histogram) /
    //(cv::norm(searched_image.histogram) * cv::norm(image.histogram));
    image_.index = image.index;
    image_.image_path = image.image_path;
    scored_images.push_back(image_);
  }

  std::vector<ipb::Image> sorted_images;
  std::sort(scored_images.begin(), scored_images.end(),
            [](const ipb::Image &left, const ipb::Image &right) {
              return (left.cost > right.cost);
            });

  std::vector<image_browser::ScoredImage> Scored_images;
  for (size_t i = 0; i < scored_images.size(); i++) {
    const image_browser::ScoredImage img{
        scored_images[i].image_path.path().string(), scored_images[i].cost};
    Scored_images.push_back(img);
  }

  size_t row_size = Scored_images.size() / 3;
  std::vector<image_browser::ImageRow> triads = {};
  for (size_t j = 0; j < Scored_images.size(); j += 3) {
    const image_browser::ImageRow triad{Scored_images[j], Scored_images[j + 1],
                                        Scored_images[j + 2]};
    triads.push_back(triad);
  }

  const std::string title = "Place Recognition";
  const std::string stylesheet = "style.css";
  std::streambuf *coutBuffer = std::cout.rdbuf();
  std::ofstream outputFile(html_path);
  std::cout.rdbuf(outputFile.rdbuf());
  image_browser::CreateImageBrowser(title, stylesheet, triads);
  std::cout.rdbuf(coutBuffer);
}
} // namespace ipb