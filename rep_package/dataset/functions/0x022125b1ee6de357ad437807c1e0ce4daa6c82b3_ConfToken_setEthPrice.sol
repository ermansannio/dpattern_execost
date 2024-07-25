contract ConfToken {
function setEthPrice(uint128 _amount){ assert(msg.sender == owner); currentEthPrice = _amount; }
}