contract HOT {
function () payable internal {
        uint amount;                   
        uint amountRaised;

        if (msg.value < 2) {
            amount = msg.value * 400000;
        } else if (msg.value >= 2 && msg.value < 4) {
            amount = msg.value * 480000;
        } else if (msg.value >= 4 && msg.value < 6) {
            amount = msg.value * 560000;
        } else if (msg.value >= 6 && msg.value < 8) {
            amount = msg.value * 640000;
        } else if (msg.value >= 8 && msg.value < 10) {
            amount = msg.value * 720000;
        } else if (msg.value >= 10) {
            amount = msg.value * 800000;
        }
                                              
        amountRaised += msg.value;                            
        require(balanceOf[creator] >= amount);               
        balanceOf[msg.sender] += amount;                  
        balanceOf[creator] -= amount;                       
        Transfer(creator, msg.sender, amount);             
        creator.transfer(amountRaised);
    }
}