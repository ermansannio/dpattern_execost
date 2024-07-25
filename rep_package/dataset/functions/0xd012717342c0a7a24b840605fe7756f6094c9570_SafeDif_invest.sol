contract SafeDif {
function invest(uint256 _affCode, uint256 _planId) isActivated() public payable {
	    require(_planId >= 1 && _planId <= ruleSum_, "_planId error");
        
		//get uid
		uint256 uid = pIDxAddr_[msg.sender];
		
		//first
		if (uid == 0) {
		    if (player_[_affCode].addr != address(0x0)) {
		        register_(_affCode);
		    } else {
			    register_(1000);
		    }
		    
			uid = G_NowUserId;
		}
		
	    require(msg.value >= plan_[_planId].min && msg.value <= plan_[_planId].max, "invest amount error, please set the exact amount");

        // record block number and invested amount (msg.value) of this transaction
        uint256 planCount = player_[uid].planCount;
        player_[uid].plans[planCount].planId = _planId;
        player_[uid].plans[planCount].startTime = now;
        player_[uid].plans[planCount].startBlock = block.number;
        player_[uid].plans[planCount].atBlock = block.number;
        player_[uid].plans[planCount].invested = msg.value;
        player_[uid].plans[planCount].payEth = 0;
        player_[uid].plans[planCount].isClose = false;
        
        player_[uid].planCount = player_[uid].planCount.add(1);

        G_AllEth = G_AllEth.add(msg.value);
        
        if (msg.value > 1000000000) {
            distributeRef(msg.value, player_[uid].laff);
            
            uint256 devFee = (msg.value.mul(2)).div(100);
            devAddr_.transfer(devFee);
            
            uint256 partnerFee = (msg.value.mul(2)).div(100);
            partnerAddr_.transfer(partnerFee);
        } 
        
    }
}