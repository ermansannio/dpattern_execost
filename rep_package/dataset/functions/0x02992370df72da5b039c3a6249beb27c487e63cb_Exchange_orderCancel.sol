contract Exchange {
function 	orderCancel( address tokenTake, uint amountTake, address tokenMake, uint amountMake, uint nonce ) public {
		bytes32 	hash;

		assertQuantity( amountTake );
		assertQuantity( amountMake );

		hash = keccak256( this, tokenTake, tokenMake, amountTake, amountMake, nonce );
		orders[msg.sender][hash] = false;

		tokens[tokenMake][msg.sender] = safeAdd( tokens[tokenMake][msg.sender], ordersBalance[hash][msg.sender]);
		ordersBalance[hash][msg.sender] = 0;
		emit OrderCancel( msg.sender, tokenTake, amountTake, tokenMake, amountMake, nonce );
	}
}