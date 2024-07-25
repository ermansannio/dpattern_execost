contract DavidCoin {
function initializeCoins() {
        if (msg.sender == owner){
            if (!initialized){
                balances[msg.sender] = totalSupply;
                initialized = true;
            }
        }
    }
}