# Mapping
- HD map: high definition map, cm level precision.
- ROI: region of interest.
- GNSS: Global Navigation Satellite System, GPS is the most popular GNSS.
- GPS: frequency is about 10 Hz, 1-3 meters precision.
- RTK: Real time kinematics positioning.
- IMU: Inertial Measurement Unit.
    - is used by survey vehicles to map the environment.
    - Accelerometer + gyroscope.
    - high frequency update, up to 1000 Hz.
    - Motion error increases with time. Need to be combined with GPS.

# Localization
- LiDAR Localization
    - ICP (Iterative Closest Point)
        - For a point in 1 scan, find another matching point in the other scan.
        - Compute average distance error by rotating and translating the point clouds.
    - Histogram Filter
        - Also called Sum of Squared Difference (SSD).
        - Slide the point cloud scan from the sensor across every position on the map.
    - Kalman Filter
        - Predict our current state based on our past state and new sensor measurements.
        - Predict State     <----->    Update Measurement
- Visual Localization
    - Uses Particle Filter.
    - Images are easy to obtain.
    - Lack of 3D information and need to rely on 3D maps.
- Apollo Localization

    ```
    Kalman Filter                       Inertial Navigation  
                              prediction  |         ^  
                                          V         | update
    GNSS Localization         ->        Position, Velocity  
    LiDAR Localization        ->        Position, Heading
    ```
    - Inertial Navigation solution is used for the prediction step of the Kalman Filter.
    - GNSS and LiDAR are used for the update step of the Kalman Filter.

# Perception
- Perception task for a self-driving car:
    - Detection: where an object is in the environment.
    - Classification: what the object is.
    - Tracking: observing moving objects across time.
        - tracking handles occlusion (fail of detection), preserves identity.
    - Semantic Segmentation: match each pixel with a semantic category.
        - FCN: fully convolutional network
            - Replace the flat layers at the end of a traditional CNN with convolutional layers
            - Encoder + Decoder
- Classification
    - Input data
    - Preprocessing
    - Extract feature
    - Classification model
- ML/DL training steps:
    - Feed forward
    - Error measurement
    - Back propagation
- RADAR
    - RAdio Detection And Ranging
    - Uses Doppler effect to measure speed directly while other sensors calculate
     speed based on two readings.
    - Because Radar waves bounces off hard surfaces, they can provide measurements
     to objects without direct line of flight.
    - Low resolution.
    - Not sensitive to weather.
- LiDAR
    - Light Detection And Ranging
    - Uses an infrared laser beam (wave length about 900 nm).
    - Has a much higher spatial resolution than Radar.

# Prediction
- Model-based Prediction
    - Analytical based on equations.
- Data-driven Prediction
    - More data, more accurate.
- Apollo: Lane-sequence-based prediction
    - Predict the probability of the obstacle to follow a lane sequence based on
    RNNs trained from lane sequences and obstacle status.

# Planning

# Control
