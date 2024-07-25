contract Exchange {
function 	order( address tokenTake, uint amountTake, address tokenMake, uint amountMake, uint nonce ) public {
		bytes32 	hash;

		assertQuantity( amountTake );
		assertQuantity( amountMake );
		assertCompareBalance( amountMake, tokens[tokenMake][msg.sender] );
		if ( orderEnd == true )
			revert();
		
		hash = keccak256( this, tokenTake, tokenMake, amountTake, amountMake, nonce );
		
		orders[msg.sender][hash] = true;
		tokens[tokenMake][msg.sender] = safeSub( tokens[tokenMake][msg.sender], amountMake );
		ordersBalance[hash][msg.sender] = amountMake;

		emit HashOutput(hash);
		emit Order( msg.sender, tokenTake, amountTake, tokenMake, amountMake, nonce );
	}
}