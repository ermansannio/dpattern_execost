contract DYLC_ERC20Token {
function afterCrowdSale() public onlyOwner {
        require( hasEnded() && !isSoleout());
        balanceOf[owner] = balanceOf[owner] + CROWD_SUPPLY - currentSupply;
        currentSupply = CROWD_SUPPLY;
      }
}