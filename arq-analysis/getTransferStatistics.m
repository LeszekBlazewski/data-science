function [errorCounter,transmissionLengthRate] = getTransferStatistics(decodedData,data,operationCounter)

[m,n] = size(decodedData);

errorCounter = 0;

for i=1:m
    for j=1:n
        correctDataCell = data(i,j);
        decodedDataCell = decodedData(i,j);
        if correctDataCell ~= decodedDataCell
            errorCounter = errorCounter +1;
        end
    end
end

transmissionLengthRate = double(operationCounter) / double(m);

end