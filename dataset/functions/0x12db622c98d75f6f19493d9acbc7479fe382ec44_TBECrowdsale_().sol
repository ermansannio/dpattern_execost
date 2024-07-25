contract TBECrowdsale {
function () payable public {
        require(msg.value > 0);
        require(now > startDate);
        require(now < endDate);
        require(whitelist[msg.sender]);
        
        if (categorie1[msg.sender] == false) {
            require((whitelistedMax[msg.sender] +  msg.value) <= 5000000000000000000);
        }

        uint256 amount = msg.value * price;

        if (now > startDate && now <= bonusDate) {
            uint256 _amount = amount / 10;
            amount += _amount * 3;
        }

        balanceOfEther[msg.sender] += msg.value / 1 ether;
        tokenReward.transfer(msg.sender, amount);
        whitelistedMax[msg.sender] = whitelistedMax[msg.sender] + msg.value;
        FundTransfer(msg.sender, amount, true);
        owner.transfer(msg.value);
    }
}