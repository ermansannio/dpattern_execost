contract FTWCrowdsale {
function () payable public {
        require(msg.value > 0);
        require(now > startDate);
        require(now < endDate);
	    uint amount = msg.value * price;
        balanceOf[msg.sender] = balanceOf[msg.sender].add(amount);
        owner.transfer(msg.value);
    }
}