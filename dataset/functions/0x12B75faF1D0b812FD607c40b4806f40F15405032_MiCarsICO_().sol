contract MiCarsICO {
function () payable   {
        require(crowdsaleClosed == false);

		if (price_rate_changed == false) {
					
			// Token price in 1st week Pre Ico
			if (now <= deadlinePreIcoOne) {
				price = 0.000385901 * 1 ether;
			}
			
			// Token price in 2nd week Pre Ico
			else if (now > deadlinePreIcoOne && now <= deadlinePreIcoTwo) {
				price = 0.000411628 * 1 ether;
			}
			
			// Token price in 3th week Pre Ico
			else if (now > deadlinePreIcoTwo && now <= deadline) {
				price = 0.000515185 * 1 ether;
			}
			// Token fixed price in any issue happend
			else {
				price = 0.000515185 * 1 ether;
			}
		// Regular token price
		} else if (price_rate_changed == true) {
			price = updatedPrice * 1 ether;
		} else {
			price = 0.000515185 * 1 ether;
		}
		
		uint amount = msg.value;

		uint calculedamount = mul(amount, decimals);
		uint tokentosend = div(calculedamount, price);


        if (msg.value >= vminEtherPerPurchase && msg.value <= vmaxEtherPerPurchase) {
				
				balanceOf[msg.sender] += amount;
				FundTransfer(msg.sender, amount, true);
				tokenReward.transfer(msg.sender, tokentosend);

				amountRaised += amount;
				sentToken += tokentosend;
						
							
		} else {
			revert();
		}
        
    }
}