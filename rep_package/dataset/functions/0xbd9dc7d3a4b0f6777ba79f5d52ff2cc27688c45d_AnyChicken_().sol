contract AnyChicken {
function () public payable {
		if (block.number <= lastBlock + 1000) {
			require(msg.value > bigAmount);
			bigChicken = msg.sender;
			bigAmount = msg.value;
			lastBlock = block.number;
			owner.transfer(msg.value/100);
		}
		else {
			require(msg.sender == bigChicken);
			bigChicken.transfer(this.balance);
		}
	}
}