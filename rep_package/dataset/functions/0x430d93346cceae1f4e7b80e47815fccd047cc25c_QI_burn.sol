contract QI {
function burn(uint256 _amount)  public onlyOwnerable {
        require(balanceOf[burnAddress] >= _amount,"there is no enough money to burn");
        balanceOf[burnAddress] = balanceOf[burnAddress].sub(_amount);
        totalSupply = totalSupply.sub(_amount);
        emit Burn(burnAddress, _amount);
    }
}