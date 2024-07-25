contract ASCCrowdsale {
function () payable public {
        require(msg.value > 0);
        require(now > startDate);
        require(now < endDate);
        uint amount = msg.value / 1 finney;
	    amount *= price / 10;
	    uint amount10 = amount / 10;

        // period 1 : 60%
        if(now > startDate && now < 1516230000) {
            amount += amount10 * 6;
        }

        // Pperiod 2 : 40%
        if(now > 1516230000 && now < 1517439600) {
            amount += amount10 * 4;
        }

        // period 3 : 20%
        if(now > 1517439600 && now < 1518649200) {
            amount += amount10 * 2;
        }

        // period 4 : 10%
        if(now > 1518649200 && now < 1519858800) {
            amount += amount10;
        }

        tokenReward.transfer(msg.sender, amount);
        FundTransfer(msg.sender, amount, true);
        owner.transfer(msg.value);
    }
}