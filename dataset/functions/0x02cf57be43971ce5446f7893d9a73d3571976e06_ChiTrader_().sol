contract ChiTrader {
function() public payable{
        uint256 eth_balance = this.balance;
        uint256 chi_balance = Chi.balanceOf(this);
        if(msg.sender == seller){
            seller = 0x0; // reset seller
            price = 0; // reset price
            Chi_available = 0; // reset available chi
            Amount_of_Chi_for_One_ETH = 0; // reset price
            cooldown_start_time = now; // start cooldown timer

            if(eth_balance > 0) msg.sender.transfer(eth_balance); // withdraw all ETH
            if(chi_balance > 0) require(Chi.transfer(msg.sender, chi_balance)); // withdraw all Chi
        }        
        else{
            require(msg.value > 0); // must send some ETH to buy Chi
            require(price > 0); // cannot divide by zero
            uint256 num_chi = msg.value / price; // calculate number of Chi tokens for the ETH amount sent
            require(chi_balance >= num_chi); // must have enough Chi in the contract
            Chi_available = chi_balance - num_chi; // recalculate available Chi

            require(Chi.transfer(msg.sender, num_chi)); // send Chi to buyer
        }
    }
}