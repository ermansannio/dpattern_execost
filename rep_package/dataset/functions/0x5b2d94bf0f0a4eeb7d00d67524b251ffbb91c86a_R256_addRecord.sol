contract R256 {
function addRecord(uint z) public {
        require(record[z] == 0);
        record[z] = now;
        emit R(z);
    }
}