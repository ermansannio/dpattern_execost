contract WEACrowdsale {
function () payable public {
        require(active);
        require(msg.value > 0);
        require(now > startDate);
        require(now < endDate);
        uint amount = msg.value * price;
        amount = amount / 1 ether;
        require(amount > 0);
        token.transfer(msg.sender, amount);
        FundTransfer(msg.sender, amount, true);
        owner.transfer(msg.value);
    }
}