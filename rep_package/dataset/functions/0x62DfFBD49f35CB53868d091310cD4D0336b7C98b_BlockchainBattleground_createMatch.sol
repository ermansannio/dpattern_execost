contract BlockchainBattleground {
function createMatch(string leftName, string rightName, uint duration, string matchQuestion) public onlyOwner matchPaidOffModifier {
	    Gladiator memory leftGlad = Gladiator(leftName, 0, new address[](0));
	    Gladiator memory rightGlad = Gladiator(rightName, 0, new address[](0));

	    currentMatch = Match(matchCount, block.timestamp, duration, matchQuestion, leftGlad, rightGlad);

	    matchCount += 1;
	    matchPaidOff = false;
    }
}