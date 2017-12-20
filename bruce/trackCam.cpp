#include <iostream>
#include <cmath>
#include <algorithm>
#include <chrono>
#include <thread>
#include <opencv2/opencv.hpp>
#include <raspicam/raspicam_cv.h>
#include "trackCam.h"

using namespace std;
using namespace cv;

TrackCam::~TrackCam(){
	if(camera->open())
		camera->release();
}

bool TrackCam::init(){
	camera = new raspicam::RaspiCam_Cv;
	if(!camera->open()){
		cout<<"Camera failed!"<<endl;
		return false;
	}
	lBound = Scalar(80, 80, 60);
	uBound = Scalar(100, 255, 255);
	if(!setScene())
		return false;
	setVertex();
	drawEdge();
	setBound();
	setIdealPoint();
	return true;
}

void TrackCam::track(){
	Mat im, im_hsv_inv, im_mask;
	//Rect bound = getBound();
	Rect bound = Rect(600, 300, 400, 500);
	vector<Point> locations;
	int x_ave = 0;
	int y_ave = 0;
	int x_pre = -1;
	int y_pre = -1;
	int pix_num = 0;
	int x_trans, y_trans;
	float lamx, lamy;
	while(true){
		//Catch a frame
		camera->grab();
		camera->retrieve(im);

		//Crop it
		bound = Rect(0, 0, 1200, 960);
		im = im(bound);

		//Get the red part
		cvtColor(~im, im_hsv_inv, COLOR_BGR2HSV);
		inRange(im_hsv_inv, lBound, uBound, im_mask);

		//Locate the center of the signal
		findNonZero(im_mask, locations);
		if(!locations.empty()){
			pix_num = locations.size();
			x_ave = y_ave = 0;
			for(int i=0; i<pix_num; ++i){
				x_ave += locations[i].x;
				y_ave += locations[i].y;
			}
			x_ave /= pix_num;
			y_ave /= pix_num;

			//Transfer the coordinate
			transformation(x_ave, y_ave, lamx, lamy);
			x_trans = int(lamx * width);
			y_trans = int(lamy * height);
		}
		else x_ave = y_ave = -1;
		
		// Print the center of the signal in (origin | tranformed) coordinate
		if(x_ave == -1) cout<<"\r(---, ---) | (---, ---)"<<flush;
		else cout<<"\r("<<x_ave<<", "<<y_ave<<") | ("<<x_trans<<", "<<y_trans<<")"<<flush;

		//Draw the trace
		//if(x_ave != -1 && x_pre != -1){
		//	line(im_track, Point(x_pre, y_pre), Point(x_ave, y_ave), Scalar(0, 255, 0), 5);

		//Set x_pre , y_pre
		x_pre = x_ave;
		y_pre = y_ave;
	}
	return;
}

bool TrackCam::setScene(){
	Mat im_hsv_inv, im_mask;
	vector<Point> locations;

	//Grab the image of a empty sight
	camera->grab();
	camera->retrieve(sceneIm);

	//Convert from BGR to HSV and mask it
	cvtColor(~sceneIm, im_hsv_inv, COLOR_BGR2HSV);
	inRange(im_hsv_inv, lBound, uBound, im_mask);

	//Find if there exist some extra red object in the enpty scene
	findNonZero(im_mask, locations);

	//Return false if any red object is detected
	if(!locations.empty()){
		cout<<"Dirty Scene!"<<endl;
		return false;
	}

	//Save the images
	imwrite("./sceneIm.jpg", sceneIm);
	imwrite("./sceneIm_mask.jpg", im_mask);
	return true;
}

void TrackCam::setVertex(){
	//Catch the four calibration points
	for(int i=0; i<4; ++i){
		//Check until the calibration point is grabbed successfully
		bool end = false;
		while(!end){
			Mat im, im_hsv_inv, im_mask;
			vector<Point> locations;
			int pix_num = 0;

			//Count down on grabbibg action
			for(int s=5; s>0; --s){
				cout<<"\rCapturing calibration point "<<i<<" in: "<<s<<flush;
				this_thread::sleep_for(chrono::seconds(1));
			}

			//Grab the image
			camera->grab();
			camera->retrieve(im);

			//Convert from BGR to HSV and mask it
			cvtColor(~im, im_hsv_inv, COLOR_BGR2HSV);
			inRange(im_hsv_inv, lBound, uBound, im_mask);

			//Find the red part
			findNonZero(im_mask, locations);

			//If red region is detected, compute its center. Otherwise, grab again.
			if(!locations.empty()){
				pix_num = locations.size();
				for(int j=0; j<pix_num; ++j){
					x[i] += locations[j].x;
					y[i] += locations[j].y;
				}
				x[i] /= pix_num;
				y[i] /= pix_num;
				cout<<"\rVertex "<<i<<" at ("<<x[i]<<", "<<y[i]<<")                   "<<endl;
				end = true;
			}
		}
	}

	return;
}

void TrackCam::drawEdge(){
	Mat edgeIm = sceneIm;

	//Draw the detected edge of screen on a scene image
	line(edgeIm, Point(x[0], y[0]), Point(x[1], y[1]), Scalar(0, 255, 0), 2);
	line(edgeIm, Point(x[1], y[1]), Point(x[2], y[2]), Scalar(0, 255, 0), 2);
	line(edgeIm, Point(x[2], y[2]), Point(x[3], y[3]), Scalar(0, 255, 0), 2);
	line(edgeIm, Point(x[3], y[3]), Point(x[0], y[0]), Scalar(0, 255, 0), 2);
	
	//Save the result
	imwrite("./edgeIm.jpg", edgeIm);

	return;
}

void TrackCam::setBound(){
	//Bound the screen with a smallest rectangle
	int x_start = min(x[0], x[3]);
	int y_start = min(y[0], y[1]);
	width = max(x[1] - x[0], x[2] - x[3]);
	height = max(y[3] - y[0], y[2] - y[1]);
	
	//Set the private variable, bound
	bound = Rect(x_start, y_start, width, height);

	//Adjust the vertices' coordination due to the change of bound
	for(int i=0; i<4; ++i){
		x[i] += x_start;
		y[i] += y_start;
	}

	//Print the result
	cout<<"Bound: "<<endl;
	cout<<"   - Origin: "<<"("<<x_start<<", "<<y_start<<")"<<endl;
	cout<<"   - Width : "<<width<<endl;
	cout<<"   - Height: "<<height<<endl;

	return;
}

void TrackCam::setIdealPoint(){
	//Pass the case for being p
	//AB: y = ax + b
	//DA: y = cx + d
	//CD: y = ex + f
	//BC: y = gx + h
	float e, f, g, h;
	a =  (float( y[1] - y[0] )) / (x[1] - x[0]);
	b = -(float( y[1] - y[0] )) / (x[1] - x[0]) * x[0] + y[0];
	c =  (float( y[2] - y[1] )) / (x[2] - x[1]);
	d = -(float( y[2] - y[1] )) / (x[2] - x[1]) * x[2] + y[2];
	e =  (float( y[2] - y[3] )) / (x[2] - x[3]);
	f = -(float( y[2] - y[3] )) / (x[2] - x[3]) * x[3] + y[3];
	g =  (float( y[3] - y[0] )) / (x[3] - x[0]);
	h = -(float( y[3] - y[0] )) / (x[3] - x[0]) * x[3] + y[3];

	//Compute the ideal points
	//I1 is the intersection of AB and CD
	//I2 is the intersection of BC and DA
	x_I1 = -(b - f) / (a - e);
	y_I1 =  x_I1 * a + b;
	x_I2 = -(h - d) / (g - c);
	y_I2 =  x_I2 * g + h;

	//Print the result
	cout<<"Ideal point 1 at: ("<<x_I1<<", "<<y_I1<<")"<<endl;
	cout<<"Ideal point 2 at: ("<<x_I2<<", "<<y_I2<<")"<<endl;

	return;
}

void TrackCam::transformation(int x_t, int y_t, float &lamx, float &lamy){
	//AB: y = ax + b
	//DA: y = cx + d
	//I1Vt: y = ex + f
	//I2Vt: y = gx + h
	float e =  (float( y_I1 - y_t )) / ( x_I1 - x_t );
	float f = -(float( y_I1 - y_t )) / ( x_I1 - x_t ) * x_t + y_t;
	float g =  (float( y_I2 - y_t )) / ( x_I2 - x_t );
	float h = -(float( y_I2 - y_t )) / ( x_I2 - x_t ) * x_t + y_t;

	//E is the intersection of AB and I2Vt
	//F is the intersection of DA and I1Vt
	float x_E = -(a - g) / (b - h);
	float x_F = -(c - e) / (d - f);

	//Set lamx and lamy
	lamx = (x_E - x[0]) / (x[1] - x[0]);
	lamy = (x_F - x[0]) / (x[3] - x[0]);

	return;
}

/*
void TrackCam::setParam(){
	bx0 = x[0] - x[1] + x[2] - x[3];
	bx1 = x[0] - x[1];
	bx2 = x[0] - x[3];
	by0 = y[0] - y[1] + y[2] - y[3];
	by1 = y[0] - y[1];
	by2 = y[0] - y[3];

	return;
}

void TrackCam::calibration(int x_t, int y_t, float &lamx, float &lamy){
	float a = float(bx1 * by0 - bx0 * by1);
	float b = float(- by0 * (x[0] - x_t) + bx0 * (y[0] - y_t) + bx2 * by1 - bx1 * by2);
	float c = float(by2 * (x[0] - x_t) - bx2 * (y[0] - y_t));

	float sq = sqrt(b * b - 4 * a * c);

	lamx = (- b + sq) / (2 * a);
	if(lamx > 1 || lamx < 0)
		lamx = (- b - sq) / (2 * a);
	lamy = (bx1 * lamx - (x[0] - x_t)) / (bx0 * lamx - bx2);

	return;
}
*/
		
