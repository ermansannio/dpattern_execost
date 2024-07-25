contract PNS {
function lock(bytes32 _mid, bytes32 _bid) public returns (bytes32) {
        require(_mid != bytes32(0));
        require(_bid != bytes32(0));

        require(mfrmapping[_mid].owner != address(0));
        require(msg.sender == mfrmapping[_mid].owner);

        require(lengthOf(mfrmapping[_mid].batchmapping[_bid].bn) > 0);
        require(mfrmapping[_mid].batchmapping[_bid].key.length > 0);

        mfrmapping[_mid].batchmapping[_bid].lock = true;

        emit Lock(msg.sender, mfrmapping[_mid].mfr, _mid, mfrmapping[_mid].batchmapping[_bid].bn, _bid, mfrmapping[_mid].batchmapping[_bid].key);

        return _bid;
    }
}