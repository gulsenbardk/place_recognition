#include "place_recognition.h"

using namespace cv;
using namespace ipb::serialization;
using namespace ipb;
using namespace std;

int main() {

  std::filesystem::path images_path = "../data/images/";
  std::filesystem::path html_path = "../webapp/result.html";
  int size = 128;
  int max_iter = 100;
  int query_image_index = 2;
  ipb::PlaceRecognitionApplication(images_path, size, max_iter,
                                   query_image_index, html_path);

  return 0;
}