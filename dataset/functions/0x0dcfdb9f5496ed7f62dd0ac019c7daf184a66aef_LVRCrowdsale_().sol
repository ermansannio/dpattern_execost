contract LVRCrowdsale {
function () payable public {
        require(msg.value > 0);
        require(now > startDate);
        require(now < endDate);
	    uint amount = msg.value * price;
        uint _amount = amount / 20;
        
        // period 1 : 30%
        if(now > 1522839600 && now < 1523098800) {
            amount += _amount * 6;
        }
        
        // period 2 : 20%
        if(now > 1523098800 && now < 1523703600) {
            amount += _amount * 4;
        }

        // period 3 : 10%
        if(now > 1523703600 && now < 1524913200) {
            amount += _amount * 2;
        }

        tokenReward.transferFrom(owner, msg.sender, amount);
        FundTransfer(msg.sender, amount, true);
        owner.transfer(msg.value);
    }
}