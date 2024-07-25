contract Cryptoraces {
function depositEther() public payable returns(uint256){
     require(msg.sender == manager,"only manager can reach  here");
    return address(this).balance;
  }
}