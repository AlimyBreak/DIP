#include<iostream>
#include<opencv2/core.hpp>
#include<opencv2/opencv.hpp>
using namespace cv;
using namespace std;
int main()
{
	Mat inFrame;
	Mat outFrame;

	int		fps			=	30				;
	char	file_out[]	=	"recorded.avi"	;
	char	win1[]		=	"Grabbing..."	;
	char	win2[]		=	"Recording..."  ;

	VideoCapture inVid(0);
	if (!inVid.isOpened())
	{
		cout << "Error,Camera not ready...\n";
		return -1;
	}

	int width  = (int)inVid.get(CAP_PROP_FRAME_WIDTH);
	int height = (int)inVid.get(CAP_PROP_FRAME_HEIGHT);

	VideoWriter recVid(file_out,VideoWriter::fourcc('M','S','V','C'),fps,Size(width,height));
	
	if (!recVid.isOpened())
	{
		cout << "Error! Video file not opened...\n";
		return -1;
	}

	namedWindow(win1);
	namedWindow(win2);
	while (true)
	{
		inVid >> inFrame;
		cvtColor(inFrame, outFrame, COLOR_BGR2GRAY);
		recVid << outFrame;
		imshow(win1, inFrame);
		imshow(win2, outFrame);
		if (waitKey(1000 / fps) >= 0)
		{
			break;
		}
	}

	inVid.release();
	recVid.release();
	
	return 0;
}