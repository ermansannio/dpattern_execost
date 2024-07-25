contract HyperPonzi {
function reinvestDividends() public {
		// Retrieve the dividends associated with the address the request came from.
		var balance = dividends(msg.sender);
		
		// Update the payouts array, incrementing the request address by `balance`.
		// Since this is essentially a shortcut to withdrawing and reinvesting, this step still holds.
		payouts[msg.sender] += (int256) (balance * scaleFactor);
		
		// Increase the total amount that's been paid out to maintain invariance.
		totalPayouts += (int256) (balance * scaleFactor);
		
		// Assign balance to a new variable.
		uint value_ = (uint) (balance);
		
		// If your dividends are worth less than 1 szabo, or more than a million Ether
		// (in which case, why are you even here), abort.
		if (value_ < 0.000001 ether || value_ > 1000000 ether)
			revert();
			
		// msg.sender is the address of the caller.
		var sender = msg.sender;
		
		// A temporary reserve variable used for calculating the reward the holder gets for buying tokens.
		// (Yes, the buyer receives a part of the distribution as well!)
		var res = reserve() - balance;

		// 10% buy fee
		var fee = div(value_, 10);
		
		// The amount of Ether used to purchase new tokens for the caller.
		var numEther = value_ - fee;
		
		// The number of tokens which can be purchased for numEther.
		var numTokens = calculateDividendTokens(numEther, balance);
		
		// The buyer fee, scaled by the scaleFactor variable.
		var buyerFee = fee * scaleFactor;
		
		// Check that we have tokens in existence (this should always be true), or
		// else you're gonna have a bad time.
		if (totalSupply > 0) {
			// Compute the bonus co-efficient for all existing holders and the buyer.
			// The buyer receives part of the distribution for each token bought in the
			// same way they would have if they bought each token individually.
			var bonusCoEff =
			    (scaleFactor - (res + numEther) * numTokens * scaleFactor / (totalSupply + numTokens) / numEther)
			    * (uint)(crr_d) / (uint)(crr_d-crr_n);
				
			// The total reward to be distributed amongst the masses is the fee (in Ether)
			// multiplied by the bonus co-efficient.
			var holderReward = fee * bonusCoEff;
			
			buyerFee -= holderReward;

			// Fee is distributed to all existing token holders before the new tokens are purchased.
			// rewardPerShare is the amount gained per token thanks to this buy-in.
			var rewardPerShare = holderReward / totalSupply;
			
			// The Ether value per token is increased proportionally.
			earningsPerToken += rewardPerShare;
		}
		
		// Add the numTokens which were just created to the total supply. We're a crypto central bank!
		totalSupply = add(totalSupply, numTokens);
		
		// Assign the tokens to the balance of the buyer.
		tokenBalance[sender] = add(tokenBalance[sender], numTokens);
		
		// Update the payout array so that the buyer cannot claim dividends on previous purchases.
		// Also include the fee paid for entering the scheme.
		// First we compute how much was just paid out to the buyer...
		var payoutDiff  = (int256) ((earningsPerToken * numTokens) - buyerFee);
		
		// Then we update the payouts array for the buyer with this amount...
		payouts[sender] += payoutDiff;
		
		// And then we finally add it to the variable tracking the total amount spent to maintain invariance.
		totalPayouts    += payoutDiff;
		
	}
}