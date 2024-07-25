contract BlockWar {
function buildLeft(address inviteAddress, uint blockNumber) public payable onlyInGame {
    	uint totalMoney = buildFee.mul(blockNumber);
    	require(msg.value >= totalMoney);
        require(blockNumber > 0);
        uint excess = msg.value.sub(totalMoney);
        uint totalBuildFee = 0;
        for (uint i=leftBlockNumber;i<leftBlockNumber+blockNumber;i++) {
    		totalBuildFee = totalBuildFee.add(getBlockBuildFee(i+1));
        }
        excess = excess.add(totalMoney.sub(totalBuildFee));
        if (excess > 0) {
        	msg.sender.transfer(excess);
        }
        // handle ether
        uint devFee = 0;
        uint inviteFee = 0;
        devFee = totalBuildFee.mul(4).div(100);
        if (inviteAddress != address(0)) {
    		inviteFee = totalBuildFee.mul(3).div(100);
        } else {
    		devFee = totalBuildFee.mul(7).div(100);  // 7% percent if not invite
        }
        owner.transfer(devFee);
        if (inviteFee > 0) {
    		inviteAddress.transfer(inviteFee);
        }
        leftBlockNumber = leftBlockNumber.add(blockNumber);
        gamePrizePool = gamePrizePool.add(totalBuildFee.sub(devFee).sub(inviteFee));

        // record user block number
        leftUserBlockNumber[currentRound][msg.sender] += blockNumber;
       	// try trigger game end
       	trigger_game_end(totalBuildFee);
    }
}