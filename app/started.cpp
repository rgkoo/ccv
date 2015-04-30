#include <iostream>
#include <ccv.hpp>
#include "config.hpp"
using namespace std;

int main(int argc, char** argv) {
	string in_file_path, out_file_path;
	in_file_path = string(DATA_PATH)+"box.png";
	out_file_path = "result.png";
	ccv_dense_matrix_t* image = 0;
	ccv_read(const_cast<char*>(in_file_path.c_str()), &image, CCV_IO_GRAY | CCV_IO_ANY_FILE);
	ccv_write(image, const_cast<char*>(out_file_path.c_str()), 0, CCV_IO_PNG_FILE, 0);
	return 0;
}
