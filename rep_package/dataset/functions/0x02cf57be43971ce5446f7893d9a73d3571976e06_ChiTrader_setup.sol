contract ChiTrader {
function setup(uint256 chi_amount, uint256 price_in_wei) public {
        require(is_empty()); // must not be in cooldown
        require(Chi.allowance(msg.sender, this) >= chi_amount); // contract needs enough allowance
        require(price_in_wei > 1000); // to avoid mistakes, require price to be more than 1000 wei
        
        price = price_in_wei;
        Chi_available = chi_amount;
        Amount_of_Chi_for_One_ETH = 1 ether / price_in_wei;
        seller = msg.sender;

        require(Chi.transferFrom(msg.sender, this, chi_amount)); // move Chi to this contract to hold in escrow
    }
}