contract BlockchainBattleground {
function payForYourGladiator(uint yourChoice) public payable matchTimeNotOver {
	    Gladiator currGlad = (yourChoice == 0) ? currentMatch.left : currentMatch.right;
	    if (currGlad.amountPaid[msg.sender] == 0)  {
		    currGlad.backersList.push(msg.sender);
	    }
	    currGlad.amountPaid[msg.sender] += msg.value;
	    currGlad.totalAmount += msg.value;
    }
}