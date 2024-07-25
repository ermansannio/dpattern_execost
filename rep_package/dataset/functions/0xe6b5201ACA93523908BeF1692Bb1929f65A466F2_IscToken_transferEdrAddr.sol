contract IscToken {
function transferEdrAddr(address _newEddr)
        isOwner
        isValidAddress
        onlyPayloadSize(32)
        public returns (bool success)
    {
        if (_newEddr != address(0)) {
            address _oldaddr = EDRADDR;
            ownerance[_newEddr] = ownerance[EDRADDR];
            ownerance[EDRADDR] = 0;
            EDRADDR = _newEddr;
            emit Transfer(_oldaddr, EDRADDR, ownerance[_newEddr]);
        }
        return true;
    }
}