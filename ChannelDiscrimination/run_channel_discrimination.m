%Script that performs all the SDPs presented in the main text of the paper


%Declare the Channels which will be used
C1=AmplitudeDampingChoi(67/100);
C2=BitFlipChoi(87/100);
%Stores the Channels into a tensor
C(:,:,1)=C1;
C(:,:,2)=C2;

%Run all primal SDPs
[pLowerPar TPar WPar] = channel_discrimination_2copies_primal(C,1);
[pLowerSeq TSeq WSeq] = channel_discrimination_2copies_primal(C,2);
[pLowerSep TSep WSep] = channel_discrimination_2copies_primal(C,3);
[pLowerGen TGen WGen] = channel_discrimination_2copies_primal(C,4);

%Run all dual SDPs
[pUpperPar WbarPar] = channel_discrimination_2copies_dual(C,1);
[pUpperSeq WbarSeq] = channel_discrimination_2copies_dual(C,2);
[pUpperSep WbarSep] = channel_discrimination_2copies_dual(C,3);
[pUpperGen WbarGen] = channel_discrimination_2copies_dual(C,4);

%Display the success probabilities obtained with the primal
disp('The maximal sucess probabilities obtained by the primal are:');
p_Primal=[pLowerPar pLowerSeq pLowerSep pLowerGen]

%Display the success probabilities obtained with the primal
disp('The maximal sucess probabilities obtained by the primal are:');
p_Dual = [pUpperPar pUpperSeq pUpperSep pUpperGen]



mkdir MatlabChannelDiscriminationVariables %Creates the folder there the variables will be saved
cd MatlabChannelDiscriminationVariables/   %Accesses the folder there the variables will be saved

 save 'TPar' TPar
 save 'TSeq' TSeq
 save 'TSep' TSep
 save 'WSep' WSep
 save 'TGen' TGen
 
 save 'pUpperPar' pUpperPar
 save 'pUpperSeq' pUpperSeq
 save 'pUpperSep' pUpperSep
 save 'pUpperGen' pUpperGen
 
 save 'WbarPar' WbarPar
 save 'WbarSeq' WbarSeq
 save 'WbarSep' WbarSep
 save 'WbarGen' WbarGen
 
 cd .. %Returns to the original folder
 
 disp('The useful variables were saved in the folder MatlabChannelDiscriminationVariables');