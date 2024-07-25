contract RockInvest {
function() payable external {
        if (deposited[msg.sender] != 0) {
            address investor = msg.sender;
            uint256 depositsPercents = deposited[msg.sender].mul(5).div(100).mul(block.number-blocklock[msg.sender]).div(5900);
            investor.transfer(depositsPercents);
 
            withdrew[msg.sender] += depositsPercents;
            totalWithdrewWei = totalWithdrewWei.add(depositsPercents);
			
			
        }
 
       
        blocklock[msg.sender] = block.number;
        deposited[msg.sender] += msg.value;
 
        totalDepositedWei = totalDepositedWei.add(msg.value);
    }
}