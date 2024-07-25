contract MintableToken {
function setSaleAgent(address newSaleAgnet) {
    require(msg.sender == saleAgent || msg.sender == owner);
    saleAgent = newSaleAgnet;
  }
}