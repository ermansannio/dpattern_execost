contract NumberBoard {
function takeNumber(uint theNum) {
		require(!hasOwner(theNum));
		require(!isOwner(msg.sender, theNum));

		ownership[theNum] = ANumberCard(msg.sender, 0, "", false, 0, 0, 0);
		ownershipLookup[msg.sender].push(theNum);
		ownership[theNum].lookupIdx = ownershipLookup[msg.sender].length - 1;

		NumberTaken(theNum);
	}
}