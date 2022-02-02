%{
    Function decodes the encoded parameter by crc16 protocol.
    Parameters:
    encodedData - horizontal vector which contains data encoded by crc 16
    returns:
    decodedData - horziontal vector which contains decoded data
    error - error which indicates whether any bit was corrupted during
    transmission ( in frame we are currently running one frame)
%}
function [decodedData, error] = crc16Decoding(encodedpacket)
encodedpacket = encodedpacket.';    %transpose the given  vector
detect = comm.CRCDetector([16 15 2 0],'ChecksumsPerFrame',1);   % create detector for CRC16
[decodedData, error] = step(detect,encodedpacket); % decode the given parameter
decodedData = decodedData.';
end