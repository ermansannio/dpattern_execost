contract SuperCountriesEth {
function buy (uint256 _itemId, address referrerAddress) payable public onlyRealAddress {
		require(priceOf(_itemId) > 0);
		require(ownerOf(_itemId) != address(0));
		require(msg.value >= priceOf(_itemId));
		require(ownerOf(_itemId) != msg.sender);
		require(!isContract(msg.sender));
		require(msg.sender != owner);
		require(block.timestamp < timestampLimit || block.timestamp > timestampLimit.add(3600));
		
		
		address oldOwner = ownerOf(_itemId);
		address newOwner = msg.sender;
		uint256 price = priceOf(_itemId);

		
		
	
	////////////////////////
	/// Set the referrer ///
	////////////////////////
		
		setReferrer(newOwner, referrerAddress);
		
	

	
	///////////////////////////////////
	/// Update scores and timestamp ///
	///////////////////////////////////
		
		/// Dividends are dispatched among players accordingly to their "playerScore".
		/// The playerScore equals the sum of all their countries (owned now, paid price) + sum of all their previously owned countries 
		/// After each sell / buy, players that owned at least one country can claim dividends
		/// DIVS of a player = playerScore * DIVS to dispatch / worldScore
		/// If a player is a seller or a buyer, his playerScore will change, we need to adjust his parameters
		/// If a player is not a buyer / seller, his playerScore doesn't change, no need to adjust
			updateScoreAndBalance(price, _itemId, oldOwner, newOwner);
			
		/// worldScore change after each flip, we need to adjust
		/// To calculate the worldScore after a flip: add buy price x 2, subtract previous price
			updateWorldScore(_itemId, price);
		
		/// If 7 days with no buys, the richest player and the last buyer win the jackpot (1/2 of contract balance ; 1/4 each)
		/// Waiting time increases after each pot distribution
			updateTimestampLimit();
	


	
	///////////////////////
	/// Who earns what? ///
	///////////////////////	
	
		/// When a country flips, who earns how much?
		/// Devs : 2% to 5% of country price
		/// Seller's reward : current paidPrice - previousPrice - devsCut = net profit. The seller gets the previous Price + ca.65% of net Profit
		/// The referrers of the seller : % of netProfit from their referrals R+1 & R+2. If no referrers, all the referrers' cut goes to dividends to all players.
		/// All players, with or without a country now : dividends (% of netProfit)
		/// All previous owners of the flipped country : a special part of dividends called Bonus. If no previous buyer, all the bonus is also added up to dividends to all players.
			
		/// Calculate the devs cut
			uint256 devCut_ = calculateDevCut(price);
			
		/// Calculate the netProfit
			uint256 netProfit = price.sub(devCut_).sub(previousPriceOfItem[_itemId]);
		
		/// Calculate dividends cut from netProfit and what referrers left
			uint256 dividendsCut_ = netProfit.mul(30).div(100);
			
		/// Calculate the seller's reward
		/// Price sub the cuts : dev cut and 35% including referrer cut (5% max), 30% (25% if referrers) dividends (including 80% divs / 20% bonus max) and 5% (jackpot)
			uint256 oldOwnerReward = price.sub(devCut_).sub(netProfit.mul(35).div(100));

		/// Calculate the referrers cut and store the referrer's cut in the referrer's pending balance ///
		/// Update dividend's cut : 30% max ; 27,5% if 1 referrer ; 25% if 2 referrers
			uint256 refCut = payReferrer(oldOwner, netProfit);
			dividendsCut_ -= refCut;
		
	

	
	////////////////////////////////////////////////////////////
	///          Dispatch dividends to all players           ///
	/// Dispatch bonuses to previous owners of this country  ///
	////////////////////////////////////////////////////////////
		
		/// Dividends = 80% to all country owners (previous and current owners, no matter the country) + 20% bonus to previous owners of this country
		/// If no previous owners, 100% to all countries owners
	
		/// Are there previous owners for the current flipped country?
			if (price > countryStructs[_itemId].startingPrice && dividendsCut_ > 1000000 && worldScore > 0) {
				
				/// Yes, there are previous owners, they will get 20% of dividends of this country
					bonusPreviousOwner(_itemId, price, dividendsCut_.mul(20).div(100));
				
				/// So dividends for all the country owners are 100% - 20% = 80%
					dividendsCut_ = dividendsCut_.mul(80).div(100); 
			} 
	
				/// If else... nothing special to do, there are no previous owners, dividends remain 100%	
		
		/// Dispatch dividends to all country owners, no matter the country
		/// Note : to avoid floating numbers, we divide a constant called HUGE (1e13) by worldScore, of course we will multiply by HUGE when retrieving
			if (worldScore > 0) { /// worldScore must be greater than 0, the opposite is impossible and dividends are not calculated
				
				dividendsScore += HUGE.mul(dividendsCut_).div(worldScore);
			}
	

	
	////////////////////////////////////////////////
	/// Update the price history of the newOwner ///
	////////////////////////////////////////////////
	
		/// The newOwner is now known as an OWNER for this country
		/// We'll store his cumulated buy price for this country in a mapping
		/// Bonus : each time a country is flipped, players that previously owned this country get bonuses proportionally to the sum of their buys	
			updateEntity(_itemId, newOwner, price);
			itemHistory[_itemId][newOwner] += price;

	

	
	////////////////////////
	/// Update the price ///
	////////////////////////
	
		/// The price of purchase becomes the "previousPrice", and the "price" is the next price 
			previousPriceOfItem[_itemId] = price;
			priceOfItem[_itemId] = nextPriceOf(_itemId);
	

	
	/////////////////////////////////////////
	/// Transfer the reward to the seller ///
	/////////////////////////////////////////

		/// The seller's reward is transfered automatically to his wallet
		/// The dev cut is transfered automatically out the contract
		/// The other rewards (bonus, dividends, referrer's cut) will be stored in a pending balance
			oldOwner.transfer(oldOwnerReward);
			owner.transfer(devCut_);
			
		/// Transfer the token from oldOwner to newOwner
			_transfer(oldOwner, newOwner, _itemId);  	
	
		/// Emit the events
			emit Bought(_itemId, newOwner, price);
			emit Sold(_itemId, oldOwner, price);	
		
	

	
	///////////////////////////////////////////
	/// Transfer the excess to the newOwner ///
	///////////////////////////////////////////
	
		/// If the newOwner sent a higher price than the asked price, the excess is refunded
			excessRefund(newOwner, price);
		

	
	/// Send informations
		emit DivsDispatch(dividendsCut_, dividendsScore, _itemId, price, worldScore);		
		
/// END OF THE BUY FUNCTION ///
  
	}
}