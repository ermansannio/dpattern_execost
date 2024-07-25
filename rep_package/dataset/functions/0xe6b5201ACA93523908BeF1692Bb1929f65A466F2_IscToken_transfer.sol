contract IscToken {
function transfer(address _to, uint _value) public
        isNotFrozen
        isValidAddress
        isNotEmpty(_to, _value)
        hasEnoughBalance(_value)
        overflowDetected(_to, _value)
        onlyPayloadSize(2 * 32)
        returns (bool success)
    {
        ownerance[msg.sender] = ownerance[msg.sender].sub(_value);
        ownerance[_to] = ownerance[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        if (msg.sender == EDRADDR) {
            totalCirculating = totalCirculating.add(_value);
            edrBalance = totalSupply - totalCirculating;
            emit TransferEdrOut(_to, _value);
        }
        if (_to == EDRADDR) {
            totalCirculating = totalCirculating.sub(_value);
            edrBalance = totalSupply - totalCirculating;
            emit TransferEdrIn(_to, _value);
        }
        return true;
    }
}