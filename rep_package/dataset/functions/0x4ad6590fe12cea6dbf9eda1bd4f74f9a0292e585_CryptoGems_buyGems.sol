contract CryptoGems {
function buyGems() public payable { 
		require( sale == true );
		require( msg.value > 0 );
		balances[ msg.sender ] += (msg.value * gemPerEther)/(1 ether);
		totalSupply += (msg.value * gemPerEther)/(1 ether);
	}
}