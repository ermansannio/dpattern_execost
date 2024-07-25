contract SnailFarm2 {
function BuyAcorns() public payable {
        require(msg.value > 0);
        require(tx.origin == msg.sender);
        require(gameStarted);
        
		if (snailPot < previousSnailPot) {
			uint256 _acornBought = ((msg.value.div(ComputeAcornPrice())).mul(3)).div(4);
			AcornPotSplit(msg.value);
		} else {
			_acornBought = (msg.value.div(ComputeAcornPrice())).div(2);
			PotSplit(msg.value);
		}
        totalAcorns = totalAcorns.add(_acornBought);
        playerAcorns[msg.sender] = playerAcorns[msg.sender].add(_acornBought);
        
        emit BoughtAcorn(msg.sender, _acornBought, msg.value);
    }
}