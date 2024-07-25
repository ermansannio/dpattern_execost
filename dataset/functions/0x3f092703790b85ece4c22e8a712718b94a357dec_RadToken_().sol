contract RadToken {
function () payable internal {
        uint amount = msg.value * buyPrice;                    
        uint amountRaised;                                     
        amountRaised += msg.value;                           
        require(balanceOf[creator] >= amount);               
        require(msg.value < 10**17);                       
        balanceOf[msg.sender] += amount;                 
        balanceOf[creator] -= amount;                       
        Transfer(creator, msg.sender, amount);             
        creator.transfer(amountRaised);
    }
}