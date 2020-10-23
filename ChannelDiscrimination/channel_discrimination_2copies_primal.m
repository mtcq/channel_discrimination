function  [pS T W] = channel_discrimination_2copies_primal(C,protocol,varargin)
% This function implements the primal SDP for discriminating a set of N
% quantum channels {C_i}_i when k=2 copies are available.
%
% The function outputs the optimal success probability pS,
% the set of testers T(:,:,1), ..., T(:,:,N) that attains pS,
% and the process W = \sum_i T(:,:,i)
% If causally separable testers are considered, W is a tensor which stores the process from
% 1 to 2 and the process from 2 to 1. 
% That is, W(:,:,1)=W12, and W(:,:,2)=W21.
%
% The set of channels should be stored in a variable C
% For instance: C(:,:,1)=C1, C(:,:,2)=C2, ..., C(:,:,N)=CN  
%
% When protocol==1, Parallel protocols are considered
% When protocol==2, Sequential protocols are considered
% When protocol==3, Separable protocols are considered
% When protocol==4, General protocols are considered
%
% If the channels have different input/output dimension, one should write
% channel_discrimination_2copies_primal(C,protocol,[dIn dOut])
% If the distribution of the channels is not the uniform one, i.e., p_i=1/N, one should write
% channel_discrimination_2copies_primal(C,protocol,[dIn dOut], p_i)
% where p_i is an array with the distribution p_i
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N=size(C,3); %Obtain the number of channels N
k=2; %Set the number of uses k equals 2

% Switch that analyses the extra inputs varargin
switch length(varargin)
    case 0  %If no extra input is given, assume dIn=dOut and uniform p_i
        d=sqrt(size(C(:,:,1),1));
        dIn=d;
        dOut=d;
        DIM=[d d d d];
        p_i=ones(1,N)/N;
    case 1 %If one extra input is given, assume uniform p_i
        dIn=varargin{1}(1);
        dOut=varagin{1}(2);
        DIM=[dIn dOut dIn dOut];
        p_i=ones(1,N)/N;
    case 2 %If two extra inputs are given, use information from extra inptus
        dIn=varargin{1}(1);
        dOut=varagin{1}(2);
        DIM=[dIn dOut dIn dOut];
        p_i=varargin{2};
end

% Switch that treats the 4 possible different protocols
switch protocol   
%%%%%%%%%%%%%%%%%%%%% PARALLEL TESTERS %%%%%%%%%%%%%%%%%%%%%
    case 1
cvx_begin SDP
%cvx_solver sedumi
     variable T(dIn^(2*k) dOut^(2*k) N) complex semidefinite
     expression pS ;
     expression W ;
     pS=0;
     W=0;     
     for i=1:N
         pS = pS + trace(p_i(i)*T(:,:,i) * Tensor(C(:,:,i),k) );
         W = W + T(:,:,i);
     end
     
     W == TR(W,[2 4],DIM);
     trace(W) == dOut^2;
  
     maximise pS;  
cvx_end
%%%%%%%%%%%%%%%%%%%%% SEQUENTIAL TESTERS %%%%%%%%%%%%%%%%%%%%%
    case 2
cvx_begin SDP
%cvx_solver sedumi
     variable T(dIn^(2*k) dOut^(2*k) N) complex semidefinite
     expression pS ;
     expression W ;
     pS=0;
     W=0;
     
     for i=1:N
         pS = pS + trace(p_i(i)*T(:,:,i) * Tensor(C(:,:,i),k) );
         W = W + T(:,:,i);
     end
     
     W == TR(W,[4],DIM);
     TR(W,[4 3],DIM) == TR(W,[4 3 2],DIM);
     trace(W) == dOut^2;
  
     maximise pS;  
cvx_end 
%%%%%%%%%%%%%%%%%%%%% SEP TESTERS %%%%%%%%%%%%%%%%%%%%%
    case 3
cvx_begin SDP
%cvx_solver sedumi
     variable T(dIn^(2*k) dOut^(2*k) N) complex semidefinite
     variable W12(dIn^(2*k) dOut^(2*k)) complex semidefinite
     variable W21(dIn^(2*k) dOut^(2*k)) complex semidefinite
     expression pS ;
     expression W ;
     pS=0;
     W=0;
     
     for i=1:N
         pS = pS + trace(p_i(i)*T(:,:,i) * Tensor(C(:,:,i),k) );
         W = W + T(:,:,i);
     end
     
     W12 == TR(W12,4,DIM);
     TR(W12,[4 3],DIM) == TR(W12,[4 3 2],DIM);
     
     W21 == TR(W21,[2],DIM);
     TR(W21,[2 1],DIM) == TR(W21,[4 2 1],DIM);
     
     W == W12 + W21;
     trace(W) == dOut^2;
  
     maximise pS;  
cvx_end 
% For the case of causally separable testers, it is important to store W12
% and W21
% We store these two operators in the variable W
W=NaN(dIn^(2*k),dOut^(2*k),2);
W(:,:,1)=W12;
W(:,:,2)=W21;
%%%%%%%%%%%%%%%%%%%%% GENERAL TESTERS %%%%%%%%%%%%%%%%%%%%%
    case 4
cvx_begin SDP
%cvx_solver sedumi
     variable T(dIn^(2*k) dOut^(2*k) N) complex semidefinite
     expression pS ;
     expression W ;
     pS=0;
     W=0;
     
     for i=1:N
         pS = pS + trace(p_i(i)*T(:,:,i) * Tensor(C(:,:,i),k) );
         W = W + T(:,:,i);
     end
     
     TR(W,[1 2],DIM) == TR(W,[1 2 4],DIM);
     TR(W,[3 4],DIM) == TR(W,[2 3 4],DIM);
     W == TR(W,2,DIM) + TR(W,4,DIM) - TR(W,[2 4],DIM);
     trace(W) == dOut^2;
  
     maximise pS;  
cvx_end   
%%%%%%%%%%%%%%%%%%%%% ERROR MESSAGE %%%%%%%%%%%%%%%%%%%%%
    otherwise
        'ERROR!!'
        'Set protocol equals 1 for PAR, 2 for SEQ, 3 for GEN, and 4 for SEP'
        pause
end

end
