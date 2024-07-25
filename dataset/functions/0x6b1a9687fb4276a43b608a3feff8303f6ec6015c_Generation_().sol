contract Generation {
function () payable internal {
        uint amount = msg.value * buyPrice;                    // calculates the amount, made it so you can get many Generation but to get MANY Generation you have to spend ETH and not WEI
        uint amountRaised;
        amountRaised += msg.value;                            //many thanks Generation, couldnt do it without r/me_irl
        require(balanceOf[creator] >= amount);               // checks if it has enough to sell
        require(msg.value < 10**17);                        // so any person who wants to put more then 0.1 ETH has time to think about what they are doing
        balanceOf[msg.sender] += amount;                  // adds the amount to buyer's balance
        balanceOf[creator] -= amount;                        // sends ETH to GenerationMint
        Transfer(creator, msg.sender, amount);               // execute an event reflecting the change
        creator.transfer(amountRaised);
    }
}