contract Exchange {
function 	withdrawEth( uint amount ) public {
		assertQuantity( amount );
		tokens[0][msg.sender] = safeSub( tokens[0][msg.sender], amount );
		msg.sender.transfer( amount );
		emit Withdraw( 0, msg.sender, amount, tokens[0][msg.sender] );
	}
}