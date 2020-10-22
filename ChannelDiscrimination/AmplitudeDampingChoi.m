function C_adp = AmplitudeDampingChoi(gamma)
% Constructs the Choi operator of an Amplidute Damping Channel

%Write a Cell with the Kraus operators
%Since this map is Completely positive, letf and right Choi operators are
%the same.
K{1,1} = [1 0; 0 sqrt(1-gamma)]; 
K{2,1} = [0 sqrt(gamma); 0 0];

C_adp = ChoiMatrix(K);
end