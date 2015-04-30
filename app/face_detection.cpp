#include <ccv.hpp>
#include <iostream>
#include <config.hpp>
#include <opencv2/opencv.hpp>
using namespace std;
using namespace cv;
int main() {
	string image_path = string(DATA_PATH)+"cmyk-jpeg-format.jpg";
	string face_model_path = string(DATA_PATH)+"face.sqlite3";
	ccv_dense_matrix_t *image =0 ;
	ccv_read(const_cast<char*>(image_path.c_str()), &image, CCV_IO_RGB_COLOR | CCV_IO_ANY_FILE);
	ccv_scd_classifier_cascade_t *cascade =
			ccv_scd_classifier_cascade_read(const_cast<char*>(face_model_path.c_str()));
	ccv_array_t *faces = ccv_scd_detect_objects(image , &cascade, 1, ccv_scd_default_params);
	cout<<"faces num: "<<faces->rnum<<endl;
	vector<Rect> rects;
	for(int i=0; i<faces->rnum; ++i) {
			ccv_comp_t *face = (ccv_comp_t*)ccv_array_get(faces, i);
			printf("%d %d %d %d\n", face->rect.x, face->rect.y, face->rect.width, face->rect.height);
			rects.push_back(Rect{face->rect.x, face->rect.y, face->rect.width, face->rect.height});
	}
	Mat src = imread(image_path);
	for(auto rect : rects) {
		cv::rectangle(src, rect,{0,0,0});
	}
	imshow("faces", src);
	cv::waitKey(-1);
	ccv_array_free(faces);
	ccv_scd_classifier_cascade_free(cascade);
	ccv_matrix_free(image);
	return 0;
}
