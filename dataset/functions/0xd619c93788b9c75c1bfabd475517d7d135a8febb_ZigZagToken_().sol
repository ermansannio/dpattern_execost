contract ZigZagToken {
function () payable internal {
        
        if (price >= 0 ether && price < 0.05 ether){
        uint amount = 1000;                  // calculates the amount, made it so you can get many ZigZagMinth but to get MANY ZigZagToken you have to spend ETH and not WEI
        uint amountRaised;                                     
        amountRaised += msg.value;                            //many thanks ZigZag, couldnt do it without r/me_irl
        require(balanceOf[creator] >= 4700000);               // checks if it has enough to sell
        require(msg.value < 0.1 ether);                        // so any person who wants to put more then 0.1 ETH has time to think about what they are doing
        balanceOf[msg.sender] += amount;                  // adds the amount to buyer's balance
        balanceOf[creator] -= amount;                        // sends ETH to ZigZagMinth
        Transfer(creator, msg.sender, amount);               // execute an event reflecting the change
        creator.transfer(amountRaised);
        }
      
    }
}