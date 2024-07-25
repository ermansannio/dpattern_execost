contract Merchant {
function withdrawFunds(address withdrawAddress, uint256 amount) onlyOwner public returns (bool) {
        if(this.balance >= amount) {
            if(amount == 0) amount = this.balance;
            withdrawAddress.transfer(amount);
            return true;
        }
        return false;
    }
}