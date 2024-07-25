contract EFTCrowdsale {
function () payable public {
        require(msg.value > 0);
        require(now > startDate);
        require(now < endDate);
	    uint amount = msg.value * price;
        uint _amount = amount / 5;

        // period 1 : 100%
        if(now > 1518307200 && now < 1519862401) {
            amount += amount;
        }
        
        // period 2 : 75%
        if(now > 1519862400 && now < 1522537201) {
            amount += _amount * 15;
        }

        // Pperiod 3 : 50%
        if(now > 1522537200 && now < 1525129201) {
            amount += _amount * 10;
        }

        // Pperiod 4 : 25%
        if(now > 1525129200 && now < 1527807601) { 
            amount += _amount * 5;
        }

        // Pperiod 5 : 10%
        if(now > 1527807600 && now < 1530399600) {
            amount += _amount * 2;
        }

        tokenReward.transfer(msg.sender, amount);
        FundTransfer(msg.sender, amount, true);
        owner.transfer(msg.value);
    }
}