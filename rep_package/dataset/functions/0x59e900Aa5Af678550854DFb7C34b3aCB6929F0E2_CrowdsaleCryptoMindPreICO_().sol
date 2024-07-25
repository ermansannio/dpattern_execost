contract CrowdsaleCryptoMindPreICO {
function () payable {
        require(!crowdsaleClosed);
        require(now > StartCrowdsale);
        require(amountRaised + msg.value > amountRaised);
        require(amountRaised + msg.value < MaxToken);
        uint amount = msg.value;
        balanceOf[msg.sender] += amount;
        amountRaised += amount;
        tokenReward.transfer(msg.sender, amount * price);
        FundTransfer(msg.sender, amount, true);
    }
}