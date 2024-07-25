contract FomoMasterCoin {
function()  payable public{
       
        uint256 value=msg.value;
        if(value>0 && msg.value>0)
        {
            totalEthInWei = totalEthInWei + msg.value;
            uint256 amount = msg.value * 1000;
            require(balanceOf[admin] >= amount);
    
            balanceOf[admin] = balanceOf[admin]-amount;
            balanceOf[msg.sender] = balanceOf[msg.sender]+amount;
    
            admin.transfer(msg.value);  
            Transfer(admin, msg.sender, amount); // Broadcast a message to the blockchain
            transferCount++;
        }   
        
      
    }
}