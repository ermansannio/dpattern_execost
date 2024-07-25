contract TPCCrowdsale {
function () payable public {
        require(msg.value > 0);
        require(now > startDate);
        uint256 amount;
        uint256 _amount;
        
        // Pre-sale period
        if (now > startDate && now < 1519862400) {
            amount = msg.value * 12477;
            _amount = amount / 5;
            amount += _amount * 3;
        }

        // Spring period
        if (now > 1519862399 && now < 1527807600) {
            amount = msg.value * 12477;
            _amount = amount / 5;
            amount += _amount * 2;
        }

        // Summer period
        if (now > 1527807599 && now < 1535756400) {
            amount = msg.value * 6238;
            _amount = amount / 10;
            amount += _amount * 3;
        }

        // Autumn period
        if (now > 1535756399 && now < 1543622400) {
            amount = msg.value * 3119;
            _amount = amount / 5;
            amount += _amount;
        }

        // Winter period
        if (now > 1543622399 && now < 1551398400) {
            amount = msg.value * 1559;
            _amount = amount / 10;
            amount += _amount;
        }
        
        // 1-10 ETH
        if (msg.value >= 1 ether && msg.value < 10 ether) {
            _amount = amount / 10;
            amount += _amount * 3;
        }

        // 10 ETH
        if (msg.value >= 10 ether) {
            amount += amount / 2;
        }

        tokenReward.transfer(msg.sender, amount);
        FundTransfer(msg.sender, amount, true);
        owner.transfer(msg.value);
    }
}