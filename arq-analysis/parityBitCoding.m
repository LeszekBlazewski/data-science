%{
Function codes the given data matrix with pairity bit protocol.
Adds 0 or 1 based on the number of 1's in the matix.
parameters:
data - matrix with data which should be send
returns:
codedData - matrix with one addition column, representing the pairity
of data.

%}
function [codedData] = parityBitCoding( data )
%   kodowanie/kontrola bledow za pomoca bitu parzystosci

  [m,n] = size(data);
  codedData = zeros(m, n+1);
  for i = 1:m
      codedData(i,1:n) = data(i,1:n);
      codedData(i,n+1) = mod(sum(data(i,1:n)),2);
  end
end