contract CyberShekel {
function transfer(address recipient, uint256 value) public returns (bool success){
    require(balanceOf[msg.sender] >= value);
    require(balanceOf[recipient] + value >= balanceOf[recipient]);
    balanceOf[msg.sender] -= value;
    balanceOf[recipient] += value;
    Transfer(msg.sender, recipient, value);

    return true;
  }
}