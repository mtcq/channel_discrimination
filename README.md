## Code to accompany *[Strict hierarchy between parallel, sequential, and indefinite-causal-order strategies for
channel discrimination](https://arxiv.org/abs/xxx)*
#### Jessica Bavaresco, Mio Murao, and Marco Túlio Quintino

This is a repository for the code used to calculate the numerical results presented in the article "*Semi-device-independent certification of indefinite causal order*, Jessica Bavaresco, Mio Murao , Marco Túlio Quintino, [arXiv:xxx](https://arxiv.org/abs/xxx)".

 MATLAB code requires:
- [cvx](http://cvxr.com/) - a free MATLAB toolbox for rapid prototyping of optimization problems
- [QETLAB](http://www.qetlab.com/) - a free MATLAB toolbox for quantum entanglement theory

 MATHEMATICA code requires:
- [QI](https://github.com/rogercolbeck/QI) - a free quantum information Mathematica package

The MATLAB code of this repositiory are: 

- [run_channel_discrimination.m](https://github.com/jessicabavaresco/SDI-causality/blob/master/randrobust_tripartiteW_TTT.m):
Script used to calculate the success probabiltiies for discriminating the Amplitude Damping and the Bit Flip channel presented in the main text and to save useful variables.

- [channel_discrimination_2copies_primal.m](https://github.com/jessicabavaresco/SDI-causality/blob/master/randrobust_tripartiteW_TTU.m):
Primal SDP to calculate maximal success probability of discriminating a set of quantum channels when two copies of the channel are available.
The user may imposte the restriction of Parallel, Sequential, Separable, or General protocols

- [channel_discrimination_2copies_dual](https://github.com/jessicabavaresco/SDI-causality/blob/master/randrobust_tripartiteW_TUU.m):
Dual SDP to calculate maximal success probability of discriminating a set of quantum channels when two copies of the channel are available.
The user may imposte the restriction of Parallel, Sequential, Separable, or General protocols

- [TR.m](https://github.com/jessicabavaresco/SDI-causality/blob/master/randrobust_tripartiteW_UTT.m):
Function that implements the Trace-And-Replace map on matrices


The MATLAB code of this repositiory are: 

- [LoadVariables.m](https://github.com/jessicabavaresco/SDI-causality/blob/master/randrobust_tripartiteW_TTT.m):
Notebook used to load important variables

- [LoadFunctions.m](https://github.com/jessicabavaresco/SDI-causality/blob/master/randrobust_tripartiteW_TTT.m):
Notebook used to load important functions

- [ComputerAssisted.m](https://github.com/jessicabavaresco/SDI-causality/blob/master/randrobust_tripartiteW_TTT.m):
Notebook used certify a computer assited proof which ensures exact upper and lower bounds for the channel discrimination problem.

This repository also includes the folder MatlabChannelDiscriminationVariables, which contains important variables used in the computer assited proof made in MATHEMATICA notebooks. Note that the MATLAB script run_channel_discrimination.m will create this folder and all the variables included on it.
