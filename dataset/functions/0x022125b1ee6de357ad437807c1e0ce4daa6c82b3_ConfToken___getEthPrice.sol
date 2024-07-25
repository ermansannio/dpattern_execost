contract ConfToken {
function __getEthPrice(uint256 price){ /* Oracle Calls this function */ assert(msg.sender == owner); currentEthPrice = price; }
}