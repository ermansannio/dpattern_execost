contract Updater {
function setStates(address[] _addr, uint8[] _exchange, uint8[] _payment) onlyOwner public {
        for(uint256 i = 0; i < _addr.length; i++){
            states[_addr[i]].exchange = _exchange[i]>0;
            states[_addr[i]].payment = _payment[i]>0;
        }
    }
}