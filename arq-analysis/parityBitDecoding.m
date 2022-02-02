%{
Decodes the given data in parameter, byc calculating the sum of one's in
the packet.
parameters:
receivedPacked - packet which contains data, after transmission.
returns:
IsReceived - test whether the bit was correctly received
uncodedData - data without the pairity bit
%}
function [uncodedData,IsReceived] = parityBitDecoding( receivedPacket )
parityBit=receivedPacket(end);
receivedData=receivedPacket(1:end-1);
parityTest = mod(sum(receivedData),2);
if parityTest==parityBit
    IsReceived = true;
else
    IsReceived = false;
end
uncodedData=receivedData;

end