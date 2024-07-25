contract ChefICO {
function () public payable beforeICOdeadline {
        uint256 amount = msg.value;
        require(!hardCapReached);
        require(amount >= minimumInvestment && balanceOf[msg.sender] < maximumInvestment);
        
        if(hardCap <= totalAmount.add(amount)) {
            hardCapReached = true;
            emit ChefICOSucceed(chefOwner, hardCap);
            
             if(hardCap < totalAmount.add(amount)) {
                uint256 returnAmount = totalAmount.add(amount).sub(hardCap);
                msg.sender.transfer(returnAmount);
                emit ChefICOTransfer(msg.sender, returnAmount, false);
                amount = amount.sub(returnAmount);    
             }
        }
        
        if(maximumInvestment < balanceOf[msg.sender].add(amount)) {
          uint overMaxAmount = balanceOf[msg.sender].add(amount).sub(maximumInvestment);
          msg.sender.transfer(overMaxAmount);
          emit ChefICOTransfer(msg.sender, overMaxAmount, false);
          amount = amount.sub(overMaxAmount);
        }

        totalAmount = totalAmount.add(amount);
        balanceOf[msg.sender] = balanceOf[msg.sender].add(amount);
               
        if (amount >= 10 ether) {
            if (amount >= 150 ether) {
                chefBalanceOf[msg.sender] = chefBalanceOf[msg.sender].add(amount.div(chefPrice).mul(135).div(100));
            }
            else if (amount >= 70 ether) {
                chefBalanceOf[msg.sender] = chefBalanceOf[msg.sender].add(amount.div(chefPrice).mul(130).div(100));
            }
            else if (amount >= 25 ether) {
                chefBalanceOf[msg.sender] = chefBalanceOf[msg.sender].add(amount.div(chefPrice).mul(125).div(100));
            }
            else {
                chefBalanceOf[msg.sender] = chefBalanceOf[msg.sender].add(amount.div(chefPrice).mul(120).div(100));
            }
        }
        else if (now <= icoStart.add(10 days)) {
            chefBalanceOf[msg.sender] = chefBalanceOf[msg.sender].add(amount.div(chefPrice).mul(120).div(100));
        }
        else if (now <= icoStart.add(20 days)) {
            chefBalanceOf[msg.sender] = chefBalanceOf[msg.sender].add(amount.div(chefPrice).mul(115).div(100));
        }
        else if (now <= icoStart.add(30 days)) {
            chefBalanceOf[msg.sender] = chefBalanceOf[msg.sender].add(amount.div(chefPrice).mul(110).div(100));
        }
        else if (now <= icoStart.add(40 days)) {
            chefBalanceOf[msg.sender] = chefBalanceOf[msg.sender].add(amount.div(chefPrice).mul(105).div(100));
        }
        else {
            chefBalanceOf[msg.sender] = chefBalanceOf[msg.sender].add(amount.div(chefPrice));
        }
        
        emit ChefICOTransfer(msg.sender, amount, true);
        
        if (totalAmount >= softCap && softCapReached == false ){
        softCapReached = true;
        emit ChefICOSucceed(chefOwner, totalAmount);
        }
    }
}