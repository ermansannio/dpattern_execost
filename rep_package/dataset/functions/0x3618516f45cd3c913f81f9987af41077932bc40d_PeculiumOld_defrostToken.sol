contract PeculiumOld {
function defrostToken() public 
	{ // Function to defrost your own token, after the date of the defrost
	
		require(now>dateDefrost);
		balancesCanSell[msg.sender]=true;
		Defroze(msg.sender,true);
	}
}