contract CryptoGems {
function buyMinersWithEther(uint64 quantity) public payable {
		require( sale == true );
		require( quantity * etherPerMiner <= msg.value);
		for(uint64 i=1;i<=quantity;i++) {
			createMiner();
		}
	}
}