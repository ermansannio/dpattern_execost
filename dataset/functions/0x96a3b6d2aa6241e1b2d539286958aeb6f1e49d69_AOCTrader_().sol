contract AOCTrader {
function() public payable{
        uint256 eth_balance = this.balance;
        uint256 AOC_balance = AOC.balanceOf(this);
        if(msg.sender == seller){
            seller = 0x0; // reset seller
            price = 0; // reset price
            AOC_available = 0; // reset available AOC
            Amount_of_AOC_for_One_ETH = 0; // reset price
            cooldown_start_time = now; // start cooldown timer

            if(eth_balance > 0) msg.sender.transfer(eth_balance); // withdraw all ETH
            if(AOC_balance > 0) require(AOC.transfer(msg.sender, AOC_balance)); // withdraw all AOC
        }        
        else{
            require(msg.value > 0); // must send some ETH to buy AOC
            require(price > 0); // cannot divide by zero
            uint256 num_AOC = msg.value / price; // calculate number of AOC tokens for the ETH amount sent
            require(AOC_balance >= num_AOC); // must have enough AOC in the contract
            AOC_available = AOC_balance - num_AOC; // recalculate available AOC

            require(AOC.transfer(msg.sender, num_AOC)); // send AOC to buyer
        }
    }
}