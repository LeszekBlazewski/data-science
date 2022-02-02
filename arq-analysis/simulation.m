data = generateData(20,10); % 20 packets, each contains 10 bits

	
twoFromFiveDecodedData = zeros (20,10);
pairityBitDecodedData = zeros(20,10);

% coding process 
crcEncodedData = crc16Coding(data);
twoFromFiveCoding = twoFromFiveCoding(data);
pairityBitCoding = parityBitCoding(data);


% send each dataset through the bs canal
probabilityOfError = 0.05;
dataAfterTransmissionWithCrcEncoding = channelBSC(crcEncodedData,probabilityOfError);
dataAfterTransmissionWithTwoFromFiveEncoding = channelBSC(twoFromFiveCoding,probabilityOfError);
dataAfterTransmissionWithPairityEncoding = channelBSC(pairityBitCoding,probabilityOfError);

% decode each data set and compare the results
for x=1:20
    [crcDecodedData(x,:),error] = crc16Decoding(dataAfterTransmissionWithCrcEncoding(x,:));
    [isPacketReceivedTwoFromFive,twoFromFiveDecodedData(x,:)] = twoFromFiveDecoding(dataAfterTransmissionWithTwoFromFiveEncoding(x,:));
    [isPacketReceivedPairityBit,pairityBitDecodedData(x,:)] = parityBitDecoding(dataAfterTransmissionWithPairityEncoding(x,:));
end

%print data to file
dlmwrite('data.txt',data,';');
dlmwrite('crcCoded.txt',crcEncodedData,';');
dlmwrite('twoFromFiveCoded.txt',twoFromFiveCoding,';');
dlmwrite('pairityBitCoded.txt',pairityBitCoding,';');
dlmwrite('crcDecoded.txt',crcDecodedData,';');
dlmwrite('twoFromFiveDecoded.txt',twoFromFiveDecodedData,';');
dlmwrite('pairityBitDecoded.txt',pairityBitDecodedData,';');