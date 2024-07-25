contract EtherHealth {
function mint(uint amount) onlyOwner returns(bool minted ){
        if (amount > 0){
            totalSupply += amount;
            balances[owner] += amount;
            Mint(msg.sender,amount);
            return true;
        }
        return false;
    }
}