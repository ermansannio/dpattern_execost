contract RK40Z {
function OWN_mintToken(uint256 mintedAmount) onlyOwner public {
        //aggiungo i decimali al valore che imposto
        balances[owner] += mintedAmount;
        totalSupply += mintedAmount;
        emit Transfer(0, this, mintedAmount);
        emit Transfer(this, owner, mintedAmount);
    }
}