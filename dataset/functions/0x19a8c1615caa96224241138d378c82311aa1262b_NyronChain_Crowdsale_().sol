contract NyronChain_Crowdsale {
function () payable {
        require(msg.value > 0);
            uint amount = msg.value;
            balanceOf[msg.sender] += amount;
            amountRaised += amount;
            if(!crowdsaleClosed){ 
            if(amountRaised >= softcap){
                tokenReward.transfer(msg.sender, amount * rate);
            }else {
                tokenReward.transfer(msg.sender, amount * rate + amount * rate * 20 / 100);
            }}
            FundTransfer(msg.sender, amount, true);
    }
}