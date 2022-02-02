%{
Function generates random bits based on the given parameters.
It uses randi funcion which returns matrix filled with random 0 and 1.

parameters:
numberOfPackets = number of rows in matrix
sizeOfPacket = number of columns in matrix

returns:
matrix which contains random data
%}
function data = generateData(numberOfPackets,sizeOfPacket)

data=randi([0 1], numberOfPackets,sizeOfPacket);

end

