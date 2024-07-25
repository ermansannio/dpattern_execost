contract ETH10K {
function setUserName(string _name)payable public{
      require(msg.value >= 0.01 ether);
      usernameOfAddress[msg.sender] = _name;
      uint256 excess = msg.value - 0.01 ether;
      if (excess > 0) {
          msg.sender.transfer(excess);
      }
  }
}