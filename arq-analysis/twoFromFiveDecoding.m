%{
Function decodes the given data vector in which data is coded in 2 from 5 protocol.
parameters:
receivedPacket - vector of size n which contains data coded with 2 from 5 protocol
returns:
uncodedData - vector of size n/5+1 with uncoded data. First bit in decoded vector
informs whether coded data was corrupted durning transmission.
isReceived - specifies whether packet given in parameter was corrupted
%}
function [uncodedData,IsReceived] = twoFromFiveDecoding( receivedPacket )
[~, n] = size(receivedPacket);
numberOfBits= n/5;
uncodedData = zeros(1, numberOfBits);
IsReceived = true;
codedOne = [1 0 1 0 0];
codedZero = [1 1 0 0 0];

for i=1:numberOfBits
    range = [(5*(i-1))+1 (5*i)];
    codedBit = receivedPacket(1,range(1):range(2));
    if isequal(codedBit, codedZero)
       uncodedData(i) = 0; 
    elseif isequal(codedBit, codedOne)
       uncodedData(i) = 1;
    else
       uncodedData(i) = 1;
       IsReceived = false;
    end
end    
end