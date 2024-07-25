contract NyronChain_Crowdsale {
function safeWithdrawal() {
        if(beneficiary == msg.sender){
            if (beneficiary.send(amountRaised)) {
                FundTransfer(beneficiary, amountRaised, false);
            }
        }
    }
}