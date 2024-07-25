contract RESERVED {
function() external payable{
        
        deposit = msg.value; //amount of investment
        
        investor = msg.sender; //address of investor
        
        msg_data = bytes(msg.data); //address of referrer
        
        owner.transfer(deposit / 10); //transfers 10% to the advertisement fund
        
        tryToWin(); //jackpot
        
        sendPayment(); //sends payment to investors
        
        updateRate(); //updates rates of investors depending on amount of investment
        
        upgradeReferrer(); //sends bonus to referrers and upgrates their rates, also increases the rate of referral
        
        
    }
}