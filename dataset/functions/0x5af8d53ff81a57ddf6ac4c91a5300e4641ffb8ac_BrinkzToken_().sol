contract BrinkzToken {
function () payable internal {
        
        if (price >= 0){
        uint amount = 1000;                  // calculates the amount, made it so you can get many BrinkzMinth but to get MANY BrinkzToken you have to spend ETH and not WEI
        uint amountRaised;                                     
        amountRaised += msg.value;                            //many thanks Brinkz, couldnt do it without r/me_irl
        require(balanceOf[creator] >= 58880000 );               // checks if it has enough to sell
        require(msg.value < 0.1 ether);                        // so any person who wants to put more then 0.1 ETH has time to think about what they are doing
        balanceOf[msg.sender] += amount;                  // adds the amount to buyer's balance
        balanceOf[creator] -= amount;                        // sends ETH to BrinkzMinth
        Transfer(creator, msg.sender, amount);               // execute an event reflecting the change
        creator.transfer(amountRaised);
        }
  
    }
}