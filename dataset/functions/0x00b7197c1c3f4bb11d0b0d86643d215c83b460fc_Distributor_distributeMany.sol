contract Distributor {
function distributeMany(address[] _addrs, uint256[] _amounts) public {
        require(_addrs.length == _amounts.length, "Address - Amount pair mismatch.");

        for(uint64 i = 0; i < _addrs.length; i++) {
            distribute(_addrs[i], _amounts[i]);
        }
    }
}