contract Exchange {
function 	depositToken( address token, uint amount ) public {
		assertToken( token );
		assertQuantity( amount );
		tokens[token][msg.sender] = safeAdd( tokens[token][msg.sender], amount );
		if ( Token( token ).transferFrom( msg.sender, this, amount ) == false ) {
			revert();
		}
	    emit	Deposit( token, msg.sender, amount , tokens[token][msg.sender] );
	}
}