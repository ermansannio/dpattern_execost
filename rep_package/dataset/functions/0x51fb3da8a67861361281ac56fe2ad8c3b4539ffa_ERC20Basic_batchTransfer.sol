contract ERC20Basic {
function batchTransfer(address[] receivers, uint256[] values) public returns (bool);
}