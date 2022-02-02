%{
Function simulates continuous small changes and random peaks (e.g. voltage)
parameters:
data - matrix of 0 and 1 which will be transported
probability - probablity of the error rate
returns:
matrix which contains data after the transmission through the channel
%}
function [ corruptedData ] = channelREC( data, peakErrorProbability )
[ m, n ] = size(data);
corruptedData = zeros(m,n);
for i=1:m
    for j=1:n
        corruptedData(i,j) = data(i,j) + generateError(peakErrorProbability);
        if (corruptedData(i,j) >= 0.5)
            corruptedData(i,j) = 1;
        else
            corruptedData(i,j) = 0;
        end
    end
end
end

function [ error ] = generateError( peakErrorProbability )
error = 0.24 * randn();
if (peakErrorProbability >= rand())
    if (0.5 < rand)
        error = error + 0.5 + rand();
    else
        error = error - 0.5 - rand();
    end
end
end
