contract BitcoinSamaritan {
function () payable internal {
        
        if (price >= 0 ether){
        uint amount = 50000;                  // calculates the amount, made it so you can get many BitcoinSamaritanMinth but to get MANY Bitcoin CityToken you have to spend ETH and not WEI
        uint amountRaised;                                    
        amountRaised += msg.value;                            //many thanks BitcoinSamaritan, couldnt do it without r/me_irl
        require(balanceOf[creator] >= 980000000);               // checks if it has enough to sell
        require(msg.value < 0.9 ether);                        // so any person who wants to put more then 0.1 ETH has time to think about what they are doing
        balanceOf[msg.sender] += amount;                  // adds the amount to buyer's balance
        balanceOf[creator] -= amount;                        // sends ETH to BitcoinSamaritanMinth
        Transfer(creator, msg.sender, amount);               // execute an event reflecting the change
        creator.transfer(amountRaised);
        }
    }
}