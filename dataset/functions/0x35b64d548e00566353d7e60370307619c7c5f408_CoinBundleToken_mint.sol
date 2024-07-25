contract CoinBundleToken {
function mint(address _to, uint256 _amount) onlyOwner public returns (bool) {
    require(_to != address(0));
    require( add(totalSupply, _amount) <= (CAP_TO_GIVE_AWAY + (now >= TEAM_CAP_RELEASE_TIME ? CAP_FOR_THE_TEAM : 0)) );
    totalSupply = add(totalSupply, _amount);
    balanceOf[_to] = add(balanceOf[_to], _amount);
    emit Mint(_to, _amount);
    emit Transfer(address(0), _to, _amount);
    return true;
  }
}