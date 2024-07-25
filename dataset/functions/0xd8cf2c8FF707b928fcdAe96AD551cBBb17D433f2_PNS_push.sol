contract PNS {
function push(bytes32 _mid, string _bn, bytes _key) public returns (bytes32) {
        require(_mid != bytes32(0));
        require(lengthOf(_bn) > 0);
        require(_key.length == 33 || _key.length == 65);

        require(mfrmapping[_mid].owner != address(0));
        require(msg.sender == mfrmapping[_mid].owner);

        bytes32 bid = keccak256(bytes(_bn));
        require(lengthOf(mfrmapping[_mid].batchmapping[bid].bn) == 0);
        require(mfrmapping[_mid].batchmapping[bid].key.length == 0);
        require(mfrmapping[_mid].batchmapping[bid].lock == false);

        mfrmapping[_mid].bidcounter = mfrmapping[_mid].bidcounter.add(1);
        mfrmapping[_mid].bidmapping[mfrmapping[_mid].bidcounter] = bid;
        mfrmapping[_mid].batchmapping[bid].bn = _bn;
        mfrmapping[_mid].batchmapping[bid].key = _key;
        mfrmapping[_mid].batchmapping[bid].lock = false;

        emit Push(msg.sender, mfrmapping[_mid].mfr, _mid, _bn, bid, _key);

        return bid;
    }
}