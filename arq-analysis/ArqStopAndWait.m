% ------------STOP AND WAIT-----------

function [operationCounter, decodedData] = ArqStopAndWait(data,probabilityOfError,canalName,codingProtocol)

operationCounter = 0;

[m,n] = size(data);

decodedData = zeros(m,n);

i = 1;

while (i <= m)
    
    % encode data
    
    switch codingProtocol
        case 'P2F5'
            encodedData = twoFromFiveCoding(data(i,:));
        case 'CRC'
            encodedData = crc16Coding(data(i,:));
        case 'PB'
            encodedData = parityBitCoding(data(i,:));     
    end
    
    % send through channel
    
    switch canalName
        case 'BSC'
            dataAfterTransmission = channelBSC(encodedData,probabilityOfError);
            
        case 'REC'
            dataAfterTransmission = channelREC(encodedData,probabilityOfError);
            
    end       
    
    % decode the data
    
    switch codingProtocol
        case 'P2F5'
            [decodedpacket,correct] = twoFromFiveDecoding(dataAfterTransmission);
        case 'CRC'
            [decodedpacket,error] = crc16Decoding(dataAfterTransmission);
            correct = ~error;
        case 'PB'
            [decodedpacket,correct] = parityBitDecoding(dataAfterTransmission);     
    end
     
    decodedData(i,:) = decodedpacket;
    
    % check if error occured
    if (correct)
        i=i+1;
    end
    
    operationCounter = operationCounter + 1;
end


end
               
