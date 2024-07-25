contract BitcoinGalaxy {
function Mine() public returns (bool success)
	{
		if (now < _rewardEnd && _currentMined >= _maxMiningReward)
			revert();
		else if (now >= _rewardEnd)
		{
			_rewardStart = now;
			_rewardEnd = now + _rewardTimePeriod;
			_currentMined = 0;
		}
	
		if (now >= _nextRewardHalving)
		{
			_nextRewardHalving = now + _rewardHalvingTimePeriod;
			_miningReward = _miningReward / 2;
			_maxMiningReward = _maxMiningReward / 2;
			_currentMined = 0;
			_rewardStart = now;
			_rewardEnd = now + _rewardTimePeriod;
		}	
		
		if ((_currentMined < _maxMiningReward) && (_totalSupply < _maxTotalSupply))
		{
			balances[msg.sender] += _miningReward;
			_currentMined += _miningReward;
			_totalSupply += _miningReward;
			Transfer(this, msg.sender, _miningReward);
			return true;
		}				
		return false;
	}
}