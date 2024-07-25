contract MntToken {
function transferLocked(address _to, uint _value, uint8 _locktype) public
        isNotFrozen
        isOwner
        isValidAddress
        isNotEmpty(_to, _value)
        hasEnoughBalance(_value)
        hasntLockedBalance(_to)
        checkLockedType(_locktype)
        returns (bool success)
    {
        require(msg.sender != _to);
        ownerance[msg.sender] = ownerance[msg.sender].sub(_value);
        if (_locktype == 1) {
            lockedance[_to] = _value;
            lockedtype[_to] = _locktype;
            lockedOwner.push(_to);
            totalCirculating = totalCirculating.sub(_value);
            emit TransferLocked(msg.sender, _to, _value, _locktype);
        } else if (_locktype == 2) {
            uint _first = _value / 100 * 8; // prevent overflow
            ownerance[_to] = ownerance[_to].add(_first);
            lockedance[_to] = _value.sub(_first);
            lockedtype[_to] = _locktype;
            lockedOwner.push(_to);
            totalCirculating = totalCirculating.sub(_value.sub(_first));
            emit Transfer(msg.sender, _to, _first);
            emit TransferLocked(msg.sender, _to, _value.sub(_first), _locktype);
        }
        return true;
    }
}