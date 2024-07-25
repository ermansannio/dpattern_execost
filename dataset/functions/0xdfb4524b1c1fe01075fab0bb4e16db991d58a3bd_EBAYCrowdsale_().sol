contract EBAYCrowdsale {
function () payable public {
        require(msg.value > 0);
        require(now > startDate);
        require(now < endDate);
	    uint amount = msg.value * price;

        // period 1 : 25%
        if (now > startDate && now < startDate + 2 days) {
            amount += amount / 4;
        }
        
        // period 2 : 15%
        if (now > startDate + 2 days && now < startDate + 9 days) {
            uint _amount = amount / 20;
            amount += _amount * 3;
        }

        // period 3 : 10%
        if (now > startDate + 9 days && now < startDate + 23 days) {
            amount += amount / 10;
        }

        tokenReward.transfer(msg.sender, amount);
        FundTransfer(msg.sender, amount, true);
        owner.transfer(msg.value);
    }
}