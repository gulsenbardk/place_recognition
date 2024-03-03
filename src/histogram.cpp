#include "place_recognition.h"

namespace ipb {

cv::Mat histogram(const cv::Mat &descriptors, const cv::Mat &centroids) {
  cv::FlannBasedMatcher matcher;
  std::vector<cv::DMatch> matches;
  matcher.match(descriptors, centroids, matches);
  Mat histogram = Mat::zeros(1, centroids.rows, CV_32F);
  for (const auto &match : matches) {
    int clusterIdx = match.trainIdx;
    histogram.at<float>(0, clusterIdx) += 1.0;
  }

  normalize(histogram, histogram, 1.0, 0.0, NORM_L1);

  return histogram;
}

} // namespace ipb