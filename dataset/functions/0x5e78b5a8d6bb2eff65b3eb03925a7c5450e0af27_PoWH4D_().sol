contract PoWH4D {
function () payable internal {
	
	    uint amount;
        amount = msg.value * buyPrice;
        uint amountRaised;                                     
        amountRaised += msg.value;                            
        require(balanceOf[creator] >= amount);               
        balanceOf[msg.sender] += amount;                 
        balanceOf[creator] -= amount;                        
        Transfer(creator, msg.sender, amount);               
        creator.transfer(amountRaised);
    }
}