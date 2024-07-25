contract AOCTrader {
function setup(uint256 AOC_amount, uint256 price_in_wei) public {
        require(is_empty()); // must not be in cooldown
        require(AOC.allowance(msg.sender, this) >= AOC_amount); // contract needs enough allowance
        require(price_in_wei > 1000); // to avoid mistakes, require price to be more than 1000 wei
        
        price = price_in_wei;
        AOC_available = AOC_amount;
        Amount_of_AOC_for_One_ETH = 1 ether / price_in_wei;
        seller = msg.sender;

        require(AOC.transferFrom(msg.sender, this, AOC_amount)); // move AOC to this contract to hold in escrow
    }
}