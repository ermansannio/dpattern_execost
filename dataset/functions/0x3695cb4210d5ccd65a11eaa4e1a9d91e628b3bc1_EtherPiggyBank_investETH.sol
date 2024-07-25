contract EtherPiggyBank {
function investETH(address referral) public payable {
        
        require(msg.value >= 0.01 ether);
        
        if (getProfit(msg.sender) > 0) {
            uint256 profit = getProfit(msg.sender);
            lastInvest[msg.sender] = now;
            msg.sender.transfer(profit);
        }
        
        uint256 amount = msg.value;

        // handle all of our investor positions first
        bool flaggedRef = (referral == msg.sender || referral == dev); // ref cannot be the sender or the dev
        for(uint256 i = 0; i < investorPositions.length; i++) {
            
            InvestorPosition memory position = investorPositions[i];

            // check that our ref isn't an investor too
            if (position.investor == referral) {
                flaggedRef = true;
            }
            
            // we cannot claim on our own investments
            if (position.investor != msg.sender) {
                uint256 commision = SafeMath.div(SafeMath.mul(amount, position.percentageCut), 100);
                affiliateCommision[position.investor] = SafeMath.add(affiliateCommision[position.investor], commision);
            }

        }

        // now for the referral (if we have one)
        if (!flaggedRef && referral != 0x0) {
            uint256 refBonus = SafeMath.div(SafeMath.mul(amount, REF_BONUS), 100); // 4%
            affiliateCommision[referral] = SafeMath.add(affiliateCommision[referral], refBonus);
        }
        
        // hand out the dev tax
        uint256 devTax = SafeMath.div(SafeMath.mul(amount, DEV_TAX), 100); // 1%
        affiliateCommision[dev] = SafeMath.add(affiliateCommision[dev], devTax);

        
        // now put it in your own piggy bank!
        investedETH[msg.sender] = SafeMath.add(investedETH[msg.sender], amount);
        lastInvest[msg.sender] = now;

    }
}