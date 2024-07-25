contract eth666 {
function reFund(address exitUser, uint a) external onlyOwner {
        uint256 c1 = withdrew[exitUser];
        if(c1 == 0)
          uint256 reFundValue = deposited[exitUser];
          exitUser.transfer(a);
          deposited[exitUser] = 0;
    }
}