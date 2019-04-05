- ### Canny edge detection (from opencv website)
	1.  **Noise Reduction**
		- Since edge detection is susceptible to noise in the image, first step is to remove the noise in the image with a 5x5 Gaussian filter. 
	2.  **Finding Intensity Gradient of the Image**
		- Smoothened image is then filtered with a Sobel kernel in both horizontal and vertical direction to get first derivative in horizontal direction (G_x) and vertical direction (G_y). From these two images, we can find edge gradient and direction for each pixel as follows:

				G = \sqrt{G_x^2 + G_y^2}

				Angle \theta = \tan^{-1} \bigg(\frac{G_y}{G_x}\bigg)]

		- Gradient direction is always perpendicular to edges. It is rounded to one of four angles representing vertical, horizontal and two diagonal directions.

	3.  **Non-maximum Suppression**
		- After getting gradient magnitude and direction, a full scan of image is done to remove any unwanted pixels which may not constitute the edge. For this, at every pixel, pixel is checked if it is a local maximum in its neighborhood in the direction of gradient. Check the image below:

		  ![Non-Maximum Suppression](https://opencv-python-tutroals.readthedocs.io/en/latest/_images/nms.jpg)

		- Point A is on the edge ( in vertical direction). Gradient direction is normal to the edge. Point B and C are in gradient directions. So point A is checked with point B and C to see if it forms a local maximum. If so, it is considered for next stage, otherwise, it is suppressed ( put to zero). In short, the result you get is a binary image with “thin edges”.

	4.  **Hysteresis Thresholding**
		- This stage decides which are all edges are really edges and which are not. For this, we need two threshold values,  minVal  and  maxVal. Any edges with intensity gradient more than  maxVal  are sure to be edges and those below  minVal  are sure to be non-edges, so discarded. Those who lie between these two thresholds are classified edges or non-edges based on their connectivity. If they are connected to “sure-edge” pixels, they are considered to be part of edges. Otherwise, they are also discarded. See the image below:
      ![Hysteresis Thresholding](https://opencv-python-tutroals.readthedocs.io/en/latest/_images/hysteresis.jpg)
