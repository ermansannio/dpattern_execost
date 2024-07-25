contract SGEPreICO {
function () payable public {
        require(msg.value >= 1 ether);
        require(now > startDate);
        require(now < endDate);
	    uint amount = msg.value * price;
        amount += amount / 2;
        tokenReward.transferFrom(owner, msg.sender, amount);
        FundTransfer(msg.sender, amount, true);
        owner.transfer(msg.value);
    }
}