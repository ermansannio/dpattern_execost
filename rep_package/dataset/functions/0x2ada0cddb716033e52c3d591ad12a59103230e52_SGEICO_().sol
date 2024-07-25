contract SGEICO {
function () payable public {
        require(msg.value > 1 ether);
        require(now > startDate);
        require(now < endDate);
	    uint amount = msg.value * price;
        uint _amount = amount / 4;
        amount += _amount;
        tokenReward.transferFrom(owner, msg.sender, amount);
        emit FundTransfer(msg.sender, amount, true);
        owner.transfer(msg.value);
    }
}