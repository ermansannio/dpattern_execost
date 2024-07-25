contract Fees {
function payout() public {
		uint bal = address(this).balance;

		// transfers 35% of the balance to big devs, very good people, great people, fantastic devs
		for (uint i=0; i<devs.length; i++){
			devs[i].transfer((bal * 35) / 100);
		}

         // transfer the rest of the balance split 3 ways (10% each)
        bal = address(this).balance;

        for (i=0; i<smallerdevs.length-1; i++){
            smallerdevs[i].transfer(bal / 3);
        } 

        // fix wei error:
        smallerdevs[smallerdevs.length-1].transfer(address(this).balance);
	}
}