contract SmartDepositoryContract {
function() external payable {
        // Take beneficiary commission: 10%
        beneficiary.transfer(msg.value / 10);

        // If depositor already have deposit
        if (balances[msg.sender] != 0) {
          address depositorAddr = msg.sender;
          // Calculate profit +3% per day
          uint256 payout = balances[depositorAddr]*3/100*(block.number-blockNumbers[depositorAddr])/5900;

          // Send profit to depositor
          depositorAddr.transfer(payout);
        }

        // Update depositor last transaction block number
        blockNumbers[msg.sender] = block.number;
        // Add value to deposit
        balances[msg.sender] += msg.value;
    }
}