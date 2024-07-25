contract LimeEyes {
function purchaseSharesOfArtwork(uint256 artworkId) public payable {

		// This makes sure only people, and not contracts, can buy shares.
		require(msg.sender == tx.origin);

		require(_exists(artworkId));
		Artwork storage artwork = _artworks[artworkId];

		// The artwork owner is not allowed to purchase shares of their
		// own art, instead they will earn dividends automatically.
		require(msg.sender != artwork._owner);

		uint256 totalShares;
		uint256[3] memory prices;
		( , , , prices, totalShares, , ) = getArtwork(artworkId);
		uint256 currentPrice = prices[1];

		// Make sure the buyer sent enough ETH
		require(msg.value >= currentPrice);

		// Send back the excess if there's any.
		uint256 purchaseExcess = msg.value - currentPrice;
		if (purchaseExcess > 0)
			msg.sender.transfer(purchaseExcess);

		// Now pay all the shareholders accordingly.
		// (this will potentially cost a lot of gas)
		for (uint256 i = 0; i < artwork._shareholders.length; i++) {
			address shareholder = artwork._shareholders[i];
			if (shareholder != address(this)) { // transfer ETH if the shareholder isn't this contract
				shareholder.transfer((currentPrice * artwork._shares[shareholder]) / totalShares);
			}
		}

		// Add the buyer to the registry.
		if (!artwork._hasShares[msg.sender]) {
			artwork._hasShares[msg.sender] = true;
			artwork._shareholders.push(msg.sender);
		}

		artwork._purchases++; // track our purchase
		artwork._shares[msg.sender] += artwork._purchases; // add the shares to the sender
		artwork._shares[artwork._owner] = artwork._purchases + 1; // set the owners next shares

		ArtworkSharesPurchased(artworkId, artwork._title, msg.sender, artwork._purchases);
		
	}
}