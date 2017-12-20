# LSTM: Long Short-Term Memory

Features:
- sensitive to scale, The default activation function for LSTMs is the hyperbolic tangent (tanh), which outputs values between -1 and 1. This is the preferred range for the time series data.
 
- A benefit of this type of network is that it can learn and remember over long sequences and does not rely on a pre-specified window lagged observation as input. in keras: stateful=True 

Methods to deal with variable length of sequences for LSTM in keras:
- pad all the sequences with 0 so they are same length (pick the max length you have)
	- from keras.preprocessing import sequence
	- sequence.pad\_sequences, see [here](https://keras.io/preprocessing/sequence/)
	- don't specify maxlen, it will use the maximum length sequence length.
		- train = sequence.pad\_sequences(train, dtype='float') 
		- note, defautly dtype is int32
- add a masking layer to your input
- use batch\_size = 1, i.e., you feed only one sequence at a time, then each sequence can have any length.

References:
- [Time Series Prediction with LSTM Recurrent Neural Networks in Python with Keras](https://machinelearningmastery.com/time-series-prediction-lstm-recurrent-neural-networks-python-keras/)
 
- [Time Series Forecasting with the Long Short-Term Memory Network in Python](https://machinelearningmastery.com/time-series-forecasting-long-short-term-memory-network-python/)
