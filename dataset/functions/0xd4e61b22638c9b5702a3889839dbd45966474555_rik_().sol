contract rik {
function () external payable {
   
        require(msg.sender != address(0));
    
        uint256 amnt = (msg.value / cost) * 1000000000000000000;
    
        mint(msg.sender, amnt);
       
        if (2000000000000 * 2 **(_totalSupply / 1000000000000000000000000) > cost)
        {
            cost = 2000000000000 * 2 **(_totalSupply / 1000000000000000000000000);
        }
       
        // maybe event
    
        wallet.transfer(msg.value);
    }
}