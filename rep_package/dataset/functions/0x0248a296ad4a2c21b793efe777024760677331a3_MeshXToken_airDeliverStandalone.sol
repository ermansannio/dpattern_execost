contract MeshXToken {
function airDeliverStandalone(address[] _addrs, uint256[] _amounts) onlyOwner public {
        require(_addrs.length <=  255);
        require(_addrs.length ==  _amounts.length);
        
        for (uint8 i = 0; i < _addrs.length;    i++) {
            airDeliver(_addrs[i],   _amounts[i]);
        }
    }
}