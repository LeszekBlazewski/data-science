%{
Function simulates the binary symmetric channel
parameters:
data - matrix of 0 and 1 which will be transported
probability - probablity of the error rate
returns:
matrix which contains data after the transmission through the canal
%}

function [ corruptedData ] = channelBSC( data, probability )

    corruptedData = bsc(data, probability);
end

