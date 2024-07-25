contract Peculium {
function ChangeLicense(address target, bool canSell) public onlyOwner
   	{
        
        	balancesCannotSell[target] = canSell;
        	FrozenFunds(target, canSell);
    	
    	}
}