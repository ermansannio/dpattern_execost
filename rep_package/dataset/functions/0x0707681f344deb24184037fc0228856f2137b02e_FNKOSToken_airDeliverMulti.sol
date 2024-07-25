contract FNKOSToken {
function airDeliverMulti(address[]  _addrs, uint256 _amount) onlyOwner public {
        require(_addrs.length <=  255);
        
        for (uint8 i = 0; i < _addrs.length; i++)   {
            airDeliver(_addrs[i],   _amount);
        }
    }
}