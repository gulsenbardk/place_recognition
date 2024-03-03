#include "place_recognition.h"
#include <filesystem>
using namespace std;
using namespace cv;
namespace ipb {
class BowDictionary {
public:
  static BowDictionary &GetInstance() {
    static BowDictionary instance;
    return instance;
  }

private:
  BowDictionary() = default; // constructor
  ~BowDictionary() = default;

public:
  BowDictionary(BowDictionary const &) = delete;
  void operator=(BowDictionary const &) = delete;

  BowDictionary(BowDictionary &&) noexcept = default;
  BowDictionary &operator=(BowDictionary &&) noexcept = default;

  int max_iter_num = 0;
  int size_num = 0;
  std::vector<cv::Mat> in_descriptors;
  cv::Mat output_mat;

  cv::Mat centroids;
  cv::Mat histogram;
  ///////////////////////////////////////////////////

  int max_iterations() const;
  int size() const; // number of centroids / codewords
  vector<Mat> descriptors() const;
  int total_features(); // number of input features

  ///////////////////////////////////////////////////

  void set_max_iterations(int max_iterations);
  void set_size(int size);
  void set_descriptors(vector<Mat> descriptors);
  void set_params(int max_iterations, int size, const vector<Mat> &descriptors);
  ///////////////////////////////////////////////////
  bool empty() const;
  ///////////////////////////////////////////
  void set_centeroids(cv::Mat in_centeroids) { centroids = in_centeroids; }
  void deserialize(const std::string &filename);
  void serialize(cv::Mat output_mat, const std::string &filename);
};

struct Image {
  std::filesystem::directory_entry image_path;
  int index;
  cv::Mat descriptor;
  cv::Mat histogram;
  double cost;
};

} // namespace ipb