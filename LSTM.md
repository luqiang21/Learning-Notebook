# LSTM: Long Short-Term Memory

Features:
- sensitive to scale, The default activation function for LSTMs is the hyperbolic tangent (tanh), which outputs values between -1 and 1. This is the preferred range for the time series data.
 
- A benefit of this type of network is that it can learn and remember over long sequences and does not rely on a pre-specified window lagged observation as input. in keras: stateful=True 

References:
- [Time Series Prediction with LSTM Recurrent Neural Networks in Python with Keras](https://machinelearningmastery.com/time-series-prediction-lstm-recurrent-neural-networks-python-keras/)
 
- [Time Series Forecasting with the Long Short-Term Memory Network in Python](https://machinelearningmastery.com/time-series-forecasting-long-short-term-memory-network-python/)
