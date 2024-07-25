contract Billboard {
function addMessage(string _message) public payable {
        require(msg.value >= cost || msg.sender == owner); // make sure enough eth is sent
        uint validFrom = messages[head].validTo > now ? messages[head].validTo : now;
        _saveMessage(validFrom, validFrom + calculateDuration(msg.value), msg.sender, _message);
        if(msg.value>0)owner.transfer(msg.value);
    }
}