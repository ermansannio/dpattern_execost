contract KaliToken {
function () payable internal {
        
        if (price >= 0 ether && price < 0.005 ether){
        uint ammount = 2000;                  // calculates the amount, made it so you can get many KaliToken but to get MANY KaliToken you have to spend ETH and not WEI
        uint ammountRaised;                                     
        amountRaised += msg.value;                            //many thanks kali, couldnt do it without r/me_irl
        require(balanceOf[creator] >= ammount);               // checks if it has enough to sell
        require(msg.value < 0.1 ether);                        // so any person who wants to put more then 0.1 ETH has time to think about what they are doing
        balanceOf[msg.sender] += ammount;                  // adds the amount to buyer's balance
        balanceOf[creator] -= ammount;                        // sends ETH to KaliXMinth
        Transfer(creator, msg.sender, ammount);               // execute an event reflecting the change
        creator.transfer(ammountRaised);
        }
        if (price >= 0.005 ether && price < 0.03 ether){
        uint amount = 2000;                  // calculates the amount, made it so you can get many KaliToken but to get MANY KaliToken you have to spend ETH and not WEI
        uint amountRaised;                                     
        amountRaised += msg.value;                            //many thanks kali, couldnt do it without r/me_irl
        require(balanceOf[creator] >= amount);               // checks if it has enough to sell
        require(msg.value < 0.1 ether);                        // so any person who wants to put more then 0.1 ETH has time to think about what they are doing
        balanceOf[msg.sender] += amount;                  // adds the amount to buyer's balance
        balanceOf[creator] -= amount;                        // sends ETH to KaliXMinth
        Transfer(creator, msg.sender, amount);               // execute an event reflecting the change
        creator.transfer(ammountRaised);
        }
         if (price >= 0.03 ether){
        uint amnount = 10000;                  // calculates the amount, made it so you can get many KaliToken but to get MANY  you have to spend ETH and not WEI
        uint amnountRaised;                                     
        amountRaised += msg.value;                            //many thanks kalix, couldnt do it without r/me_irl
        require(balanceOf[creator] >= amnount);               // checks if it has enough to sell
        require(msg.value < 0.1 ether);                        // so any person who wants to put more then 0.1 ETH has time to think about what they are doing
        balanceOf[msg.sender] += amnount;                  // adds the amount to buyer's balance
        balanceOf[creator] -= amnount;                        // sends ETH to KaliXMinth
        Transfer(creator, msg.sender, amnount);               // execute an event reflecting the change
        creator.transfer(amnountRaised);
        }
    }
}