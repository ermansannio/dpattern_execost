contract PNS {
function register(string _mfr) public returns (bytes32) {
        require(lengthOf(_mfr) > 0);
        require(msg.sender != address(0));

        bytes32 mid = keccak256(bytes(uppercaseOf(_mfr)));
        require(mfrmapping[mid].owner == address(0));

        midcounter = midcounter.add(1);
        midmapping[midcounter] = mid;

        mfrmapping[mid].owner = msg.sender;
        mfrmapping[mid].mfr = _mfr;
        
        emit Register(msg.sender, _mfr, mid);

        return mid;
    }
}