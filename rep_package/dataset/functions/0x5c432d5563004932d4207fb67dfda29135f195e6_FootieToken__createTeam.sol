contract FootieToken {
function _createTeam(string _name, uint256 _price) public onlyCreator {
		require(teamsCreatedCount < TEAM_CREATION_LIMIT);
		// set initial price
		if (_price <= 0) {
			_price = startingPrice;
		}

		// increase the number of teams created so far
		teamsCreatedCount++;

		Team memory _team = Team({
			name: _name
		});
		uint256 newteamId = teams.push(_team) - 1;

		// It's probably never going to happen, 4 billion tokens are A LOT, but
		// let's just be 100% sure we never let this happen.
		require(newteamId == uint256(uint32(newteamId)));

		// send event to DAPP or anyone interested
		Birth(newteamId, _name, creatorAddress);

		teamIndexToPrice[newteamId] = _price;

		// This will assign ownership, and also emit the Transfer event as
		// per ERC721 draft
		_transfer(creatorAddress, creatorAddress, newteamId);
	}
}