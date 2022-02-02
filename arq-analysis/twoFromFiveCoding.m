%{
Function codes the fiven data with the 2 from 5 protocol.
parameters:
data - matrix containing data which should be sent via the canal.
codedData - matrix which contains each bit coded in 2 from 5 protocol
%}

function [codedData] = twoFromFiveCoding( data )
[m, n] = size(data);
codedData = zeros(m, n*5);

for i = 1:m
    for j = 1:n
        x = 5*(j-1) + 1;
        if data(i,j) == 0
            codedData(i, x:x+4) = [1, 1 , 0, 0, 0];
        else
            codedData(i, x:x+4) = [1, 0 , 1, 0, 0];
        end
    end
end 
end