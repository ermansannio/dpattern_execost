contract EthProfit {
function() external payable{
        //buffer overflow protection
        require((balances[msg.sender] + msg.value) >= balances[msg.sender]);
        createDeposit();
       
    }
}