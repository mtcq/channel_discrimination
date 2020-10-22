function C_bf= BitFlipChoi(eta)
% Constructs the Choi operator of a Bit Flip channel

%Write a Cell with the Kraus operators
%Since this map is Completely positive, letf and right Choi operators are
%the same.
K{1,1} = sqrt(eta)*eye(2);
K{2,1} = sqrt(1-eta)*[0 1; 1 0];

C_bf = ChoiMatrix(K);
end