%{
    Function codes the given data with crc16 protocol.
    Parameters:
    data - matrix of zeroes and ones to encode
    returns:
    matrix with encoded data, where each row contains coded data with it's
    reminder
%}
function [codedData] = crc16Coding(data)
gen = comm.CRCGenerator([16 15 2 0],'ChecksumsPerFrame',1); % generator of checksum
[n,m] = size(data); % get number of rows (n) and number of columns (m)
codedData = zeros(n,m+16);  % empty matrix for storing coded data, when using crc 16 protocol there are additional 16 columns added.

for x=1:n
    msg = data(x,:).'; % get row and transpose it because generator requires it
    codedData(x,:) = step(gen,msg).';  % uses generator to encode provided data and transpose it back to fit matrix
end
end
