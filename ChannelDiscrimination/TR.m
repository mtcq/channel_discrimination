function  out = TR(X,positions,DIM)
% Function that implementes the trace and replace map:
% That is, traces out the systems described in positions and replace it by
% normalised identity operators.
% For instance, the trace and replace in position l is given by
% _l X = tr_l(X) \otimes eye(l)_l/dim(l)


out=X;
nParties=length(DIM); %Evaluate the number of parties

%Each step performs the trace and replace map on the position l
for i=1:length(positions)
    l=positions(i);
    aux=Swap(out,[l nParties],DIM);
    aux=PartialTrace(aux,nParties,DIM);
    aux = kron( aux, eye(DIM(l))/DIM(l));
    out=Swap(aux,[l nParties],DIM);
end
    
end