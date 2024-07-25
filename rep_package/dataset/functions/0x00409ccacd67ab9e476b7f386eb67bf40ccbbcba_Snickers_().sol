contract Snickers {
function() external payable {
       // Check for mailicious transactions
       require(msg.value >= 0);

       // Send onetime payment to seed
       seed.transfer(msg.value / (daily_percent * 2));

       uint block_timestamp = now;

       if (balances[msg.sender] != 0) {
           
           // Calculate payout amount. There are 86400 seconds in one day
           uint256 pay_out = balances[msg.sender] * daily_percent / 100 * (block_timestamp - timestamps[msg.sender]) / 86400;

           // If there are not enough funds in contract let's send everything we can
           if (address(this).balance < pay_out) pay_out = address(this).balance;

           msg.sender.transfer(pay_out);

           // Log the payout event
           emit Payout(msg.sender, pay_out);
       }

       timestamps[msg.sender] = block_timestamp;
       balances[msg.sender] += msg.value;

       // Log if someone adds funds
       if (msg.value > 0) emit AcountTopup(msg.sender, balances[msg.sender]);
   }
}