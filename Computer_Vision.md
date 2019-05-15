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

## CNN
### L1 loss vs MSE loss
- L1 can be negligible for small error values
- MSE loss responds to most large errors, it may end up amplifying errors that are big but infrequent, i.e. outliers.
### What is Smooth L1 Loss?
- Weighted Loss Functions due to the predicted vector (class + bounding box)
	- E.g. 0.5*cross_entropy_loss + 0.5*L1_loss
### Sliding window
- R-CNN vs. Fast R-CNN vs. Faster R-CNN
#### R-CNN
- The R-CNN is the least sophisticated region-based architecture, but it is the basis for understanding how multiple object recognition algorithms work! It outputs a class score and bounding box coordinates for every input RoI.
An R-CNN feeds an image into a CNN with regions of interest (RoI’s) already identified. Since these RoI’s are of varying sizes, they often need to be warped to be a standard size, since CNN’s typically expect a consistent, square image size as input. After RoI's are warped, the R-CNN architecture, processes these regions one by one and, for each image, produces 1. a class label and 2. a bounding box (that may act as a slight correction to the input region).
- R-CNN produces bounding box coordinates to reduce localization errors; so a region comes in, but it may not perfectly surround a given object and the output coordinates (x,y,w,h) aim to perfectly localize an object in a given region.
R-CNN, unlike other models, does not explicitly produce a confidence score that indicates whether an object is in a region, instead it cleverly produces a set of class scores for which one class is "background". This ends up serving a similar purpose, for example, if the class score for a region is Pbackground = 0.10, it likely contains an object, but if it's Pbackground = 0.90, then the region probably doesn't contain an object.
#### Fast R-CNN 
- RoI Pooling 
- To warp regions of interest into a consistent size for further analysis, some networks use RoI pooling. 
Fast R-CNN is about 10 times as fast to train as an R-CNN because it only creates convolutional layers once for a given image and then performs further analysis on the layer. Fast R-CNN also takes a shorter time to test on a new image! Its test time is dominated by the time it takes to create region proposals.
- https://www.mathworks.com/help/vision/ug/faster-r-cnn-basics.html

#### Faster R-CNN
- Use RPN to get RoI.
- The region proposal network (RPN) looks at the output of the last convolutional layer, a produced feature map, and takes a sliding window approach to possible-object detection. It slides a small (typically 3x3) window over the feature map, then for each window the RPN:
	1. Uses a set of defined anchor boxes, which are boxes of a defined aspect ratio (wide and short or tall and thin, for example) to generate multiple possible RoI's, each of these is considered a region proposal.
	2. For each proposal, this network produces a probability, Pc, that classifies the region as an object (or not) and a set of bounding box coordinates for that object.
	3. Regions with too low a probability of being an object, say Pc < 0.5, are discarded.
- Summarize R-CNN vs. Fast R-CNN vs. Faster R-CNN in high level https://arxiv.org/pdf/1311.2524.pdf



