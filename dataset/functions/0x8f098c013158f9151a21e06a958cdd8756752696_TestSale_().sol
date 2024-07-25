contract TestSale {
function () external payable isActive {
    participate(msg.sender);
  }
}