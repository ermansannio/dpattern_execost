contract LimeEyes {
function createArtwork(string title, address owner, uint256 basePrice) public onlyDev {

		require(basePrice != 0);
		_artworks.push(Artwork({
			_title: title,
			_owner: owner,
			_visible: true,
			_basePrice: basePrice,
			_purchases: 0,
			_shareholders: new address[](0)
		}));
		uint256 artworkId = _artworks.length - 1;
		Artwork storage newArtwork = _artworks[artworkId];
		newArtwork._hasShares[owner] = true;
		newArtwork._shareholders.push(owner);
		newArtwork._shares[owner] = 1;

		ArtworkCreated(artworkId, title, owner, basePrice);

	}
}