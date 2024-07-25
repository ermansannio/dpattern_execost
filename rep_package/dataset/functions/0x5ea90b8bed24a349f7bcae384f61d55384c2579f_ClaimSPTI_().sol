contract ClaimSPTI {
function() public payable {
        
        require(now > startDate);
        require(now < endDate);
        require(msg.value == 0); // Only 0 ether accepted, This is not an IC Oh!
        uint oldSptiUserBal;
        oldSptiUserBal = getBalance(msg.sender); //Get Old SPTI balance
        require(oldSptiUserBal > 0); // Make sure claimant actually possesses Old SPTI
        require(oldToken.transferFrom(msg.sender, 0xceC74106a23329745b07f6eC5e1E39803b3fF31F, oldSptiUserBal));
        
        //If all of the above happens accordingly, go ahead and release new token
        //to old token holders
        uint256 amount = oldSptiUserBal.div(8);
        newTokenReward.transfer(msg.sender, amount);
        emit FundTransfer(msg.sender, amount, true);

    }
}