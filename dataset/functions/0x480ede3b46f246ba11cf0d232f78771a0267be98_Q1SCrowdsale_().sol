contract Q1SCrowdsale {
function () payable public {
        require(msg.value > 0);
        require(now > startDate);
        require(now < endDate);
	    uint amount = msg.value * price;
        uint _amount = amount / 20;

        // period 1 : 40%
        if(now > 1517184000 && now < 1517529601) {
            amount += _amount * 8;
        }
        
        // period 1 : 20%
        if(now > 1517529600 && now < 1518134401) {
            amount += _amount * 4;
        }

        // Pperiod 2 : 15%
        if(now > 1518134400 && now < 1518652801) {
            amount += _amount * 3;
        }

        // period 3 : 10%
        if(now > 1518652800 && now < 1519257601) {
            amount += _amount * 2;
        }

        // period 4 : 5%
        if(now > 1519257600 && now < 1519862401) {
            amount += _amount;
        }

        // period 5 : 0%
        if(now > 1519862400 && now < 1520035200) {
            amount += _amount;
        }

        tokenReward.transferFrom(owner, msg.sender, amount);
        FundTransfer(msg.sender, amount, true);
        owner.transfer(msg.value);
    }
}