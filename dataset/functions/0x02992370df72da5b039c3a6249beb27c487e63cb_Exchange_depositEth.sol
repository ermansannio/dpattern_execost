contract Exchange {
function 	depositEth() payable public {
 		assertQuantity( msg.value );
		tokens[0][msg.sender] = safeAdd( tokens[0][msg.sender], msg.value );
		emit Deposit( 0, msg.sender, msg.value, tokens[0][msg.sender] );
 	}
}