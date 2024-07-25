contract NBACrypto {
function purchasePlayer(uint256 _playerId) public payable {
    require(msg.value == players[_playerId].curPrice);
	require(isPaused == false);

    // Calculate dev fee
		uint256 commissionDev = (msg.value / 10);

    //Calculate commision for team owner
    uint256 commisionTeam = (msg.value / 5);

    uint256 afterDevCut = msg.value - commissionDev;



		// Calculate the owner commission on this sale & transfer the commission to the owner.
		uint256 commissionOwner = afterDevCut - commisionTeam; //
		players[_playerId].ownerAddress.transfer(commissionOwner);
    teams[players[_playerId].realTeamId].ownerAddress.transfer(commisionTeam);

		// Transfer fee to Dev
		cfoAddress.transfer(commissionDev);

		// Update the team owner and set the new price


		players[_playerId].ownerAddress = msg.sender;
		players[_playerId].curPrice = mul(players[_playerId].curPrice, 2);
  }
}