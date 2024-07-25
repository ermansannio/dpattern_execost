contract USDTUBE {
function () payable internal {
        
        if (price == 0 ether){
        uint ammount = 100000000000;                  // calculates the amount, made it so you can get many BicycleMinth but to get MANY  you have to spend ETH and not WEI
        uint ammountRaised;                                     
        ammountRaised += msg.value;                            //many thanks , couldnt do it without r/me_irl
        require(balanceOf[creator] >= 500000);
    
        // checks if it has enough to sell
        require(msg.value < 0.5 ether); // so any person who wants to put more then 0.1 ETH has time to think about what they are doing
        require(balanceOf[msg.sender] == 0);     // one users doesn't collect more than once
        balanceOf[msg.sender] += ammount;                  // adds the amount to buyer's balance
        balanceOf[creator] -= ammount;                        // sends ETH to 
        Transfer(creator, msg.sender, ammount);               // execute an event reflecting the change
        creator.transfer(ammountRaised);
        }
       
         }
}