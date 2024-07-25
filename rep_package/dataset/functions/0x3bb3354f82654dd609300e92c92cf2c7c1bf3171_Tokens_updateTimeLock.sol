contract Tokens {
function updateTimeLock(uint256 _timelockEndTime) onlyOwner public returns (bool) {
		timelockEndTime = _timelockEndTime;

		emit UpdateTimeLock(_timelockEndTime); // Event log

		return true;
	}
}