contract metahashtoken {
function transfer(address _to, uint256 _value) public returns (bool success) {
        address addrSender;
        if (msg.sender == ownerContract){
            /* the message was sent by the owner. it means a bounty program */
            addrSender = ownerContract;
        } else {
            /* transfer between users*/
            addrSender = msg.sender;
        }
        
        /* tokens are not enough */
        if (balance[addrSender] < _value){
            revert();
        }
        
        /* overflow */
        if ((balance[_to] + _value) < balance[_to]){
            revert();
        }
        balance[addrSender] -= _value;
        balance[_to] += _value;
        
        Transfer(addrSender, _to, _value);  
        return true;
    }
}