contract KaiserExTokenCrowdsale {
function () payable public {
        require(msg.value > 0);
        require(now > startDate);
        require(now < endDate);
        uint amount = msg.value * 1000;
        if(now < endPresaleDate) {
        	amount = msg.value * 1200;
        	require(presaleAmount >= amount);
        	presaleAmount -= amount;
        }
        require(amount >= 5 * 1 ether);
        tokenReward.transfer(msg.sender, amount);
        FundTransfer(msg.sender, amount, true);
        ICOowner.transfer(msg.value);
    }
}