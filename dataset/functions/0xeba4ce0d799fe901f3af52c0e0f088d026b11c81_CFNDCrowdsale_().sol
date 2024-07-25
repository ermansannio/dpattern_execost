contract CFNDCrowdsale {
function () payable public {
        require(msg.value > 0);
        require(now > 1527238800);
        uint256 amount = msg.value * price;
        uint256 _amount = amount / 100;

        
        // stage 1
        if (now > 1527238800 && now < 1527670800) {
            amount += _amount * 15;
        }

        // stage 2
        if (now > 1527843600 && now < 1528189200) {
            amount += _amount * 10;
        }

        // stage 3
        if (now > 1528275600 && now < 1528621200) {
            amount += _amount * 5;
        }

        // stage 4
        if (now > 1528707600 && now < 1529053200) {
            amount += _amount * 2;
        }

        // stage 5
        require(now < 1531123200);

        tokenReward.transfer(msg.sender, amount);
        FundTransfer(msg.sender, amount, true);
        owner.transfer(msg.value);
    }
}