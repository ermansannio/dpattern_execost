contract UTEMIS {
function transfer(address _to , uint _value) public onlyOwner{                                             
        _transfer(msg.sender , _to , _value);                                       //Internal transfer
    }
}