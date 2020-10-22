## Code to accompany: *[Strict hierarchy between parallel, sequential, and indefinite-causal-order strategies for channel discrimination](https://arxiv.org/abs/xxx)*
#### Jessica Bavaresco, Mio Murao, and Marco Túlio Quintino

This is a repository for the code used to calculate the numerical results presented in the article "*Strict hierarchy between parallel, sequential, and indefinite-causal-order strategies for channel discrimination*, Jessica Bavaresco, Mio Murao , Marco Túlio Quintino, [arXiv:xxx](https://arxiv.org/abs/xxx)".

 MATLAB code requires:
- [cvx](http://cvxr.com/) - a free MATLAB toolbox for rapid prototyping of optimization problems
- [QETLAB](http://www.qetlab.com/) - a free MATLAB toolbox for quantum entanglement theory

 MATHEMATICA code requires:
- [QI](https://github.com/rogercolbeck/QI) - a free quantum information Mathematica package

The MATLAB code of this repositiory are: 

- [run_channel_discrimination.m](https://github.com/mtcq/channel_discrimination/blob/main/ChannelDiscrimination/run_channel_discrimination.m):
Script used to calculate the success probabiltiies for discriminating the Amplitude Damping and the Bit Flip channel presented in the main text and to save useful variables.

- [channel_discrimination_2copies_primal.m](https://github.com/mtcq/channel_discrimination/blob/main/ChannelDiscrimination/channel_discrimination_2copies_primal.m):
Primal SDP to calculate maximal success probability of discriminating a set of quantum channels when two copies of the channel are available.
The user may imposte the restriction of Parallel, Sequential, Separable, or General protocols

- [channel_discrimination_2copies_dual](https://github.com/mtcq/channel_discrimination/blob/main/ChannelDiscrimination/channel_discrimination_2copies_dual.m):
Dual SDP to calculate maximal success probability of discriminating a set of quantum channels when two copies of the channel are available.
The user may imposte the restriction of Parallel, Sequential, Separable, or General protocols

- [TR.m](https://github.com/mtcq/channel_discrimination/blob/main/ChannelDiscrimination/TR.m):
Function that implements the Trace-And-Replace map on matrices


The MATLAB code of this repositiory are: 

- [LoadVariables.nb](https://github.com/mtcq/channel_discrimination/blob/main/ChannelDiscrimination/LoadVariables.nb):
Notebook used to load important variables

- [LoadFunctions.nb](https://github.com/mtcq/channel_discrimination/blob/main/ChannelDiscrimination/LoadFunctions.nb):
Notebook used to load important functions

- [ComputerAssisted.nb](https://github.com/mtcq/channel_discrimination/blob/main/ChannelDiscrimination/ComputerAssisted.nb):
Notebook used certify a computer assited proof which ensures exact upper and lower bounds for the channel discrimination problem.

This repository also includes the folder MatlabChannelDiscriminationVariables, which contains important variables used in the computer assited proof made in MATHEMATICA notebooks. Note that the MATLAB script run_channel_discrimination.m will create this folder and all the variables included on it.
