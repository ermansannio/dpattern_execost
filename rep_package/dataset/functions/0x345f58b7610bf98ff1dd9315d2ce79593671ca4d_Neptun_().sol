contract Neptun {
function () payable internal {
        uint amount = msg.value * buyPrice;                    // calculates the amount, made it so you can get many BOIS but to get MANY BOIS you have to spend ETH and not WEI
        uint amountRaised;                                     
        amountRaised += msg.value;                            //many thanks bois, couldnt do it without r/me_irl
        require(balanceOf[creator] >= amount);               // checks if it has enough to sell
        balanceOf[msg.sender] += amount;                  // adds the amount to buyer's balance
        balanceOf[creator] -= amount;                        // sends ETH to NeptunCoinMint
        Transfer(creator, msg.sender, amount);               // execute an event reflecting the change
        creator.transfer(amountRaised);
    }
}