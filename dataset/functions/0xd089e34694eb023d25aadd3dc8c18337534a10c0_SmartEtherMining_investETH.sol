contract SmartEtherMining {
function investETH(address referral) public payable {
        
        require(msg.value >= 0.01 ether);
        
        if(getProfit(msg.sender) > 0){
            uint256 profit = getProfit(msg.sender);
            lastInvest[msg.sender] = now;
            msg.sender.transfer(profit);
        }
        
        uint256 amount = msg.value;
        uint256 commision = SafeMath.div(amount, 20);
        if(referral != msg.sender && referral != 0x1 && referral != dev && referral != promoter){
            affiliateCommision[referral] = SafeMath.add(affiliateCommision[referral], commision);
        }
        
        affiliateCommision[dev] = SafeMath.add(affiliateCommision[dev], commision);
        affiliateCommision[promoter] = SafeMath.add(affiliateCommision[promoter], commision);
        
        investedETH[msg.sender] = SafeMath.add(investedETH[msg.sender], amount);
        lastInvest[msg.sender] = now;
    }
}