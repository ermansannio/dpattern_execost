contract InvestETH {
function() payable external {
		uint256 admRefPerc = msg.value.mul(5).div(100);
		uint256 advPerc = msg.value.mul(10).div(100);

		advAddress.transfer(advPerc);
		admAddress.transfer(admRefPerc);

		if (deposited[msg.sender] != 0) {
			address investor = msg.sender;
			uint256 depositsPercents = deposited[msg.sender].mul(4).div(100).mul(block.number-blocklock[msg.sender]).div(5900);
			investor.transfer(depositsPercents);

			withdrew[msg.sender] += depositsPercents;
			totalWithdrewWei = totalWithdrewWei.add(depositsPercents);
		}

		address referrer = bytesToAddress(msg.data);
		if (referrer > 0x0 && referrer != msg.sender) {
			referrer.transfer(admRefPerc);

			refearned[referrer] += admRefPerc;
		}

		blocklock[msg.sender] = block.number;
		deposited[msg.sender] += msg.value;

		totalDepositedWei = totalDepositedWei.add(msg.value);
	}
}