contract GrowToken {
function transfer(address _to,uint256 _value) public{
        require(!frozenAccount[msg.sender]);
        if(_to == address(this)){
          _sell(msg.sender,_value);
        }else{
            _transfer(msg.sender,_to,_value);
        }
    }
}