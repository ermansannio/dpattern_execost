contract CryptoGems {
function buyMinersWithGem(uint64 quantity) public {
		require( sale == true );
		require( quantity * gemPerMiner <= balances[ msg.sender ]);
		balances[ msg.sender ] -= quantity * gemPerMiner;
		balances[ contractOwner ] += quantity * gemPerMiner;

		emit Transfer(msg.sender, contractOwner, quantity * gemPerMiner);


		for(uint64 i=1;i<=quantity;i++) {
			createMiner();
		}
	}
}