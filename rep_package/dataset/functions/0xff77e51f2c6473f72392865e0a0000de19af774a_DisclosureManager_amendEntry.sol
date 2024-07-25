contract DisclosureManager {
function amendEntry(uint rowNumber,
						bytes32 organization,
						bytes32 recipient,
						bytes32 location,
						bytes16 amount,
						bytes1 fundingType,
						bytes16 date,
						bytes32 purpose,
						bytes32 comment) public isOwner() returns(uint newRowNumber) {    // returns the new rowNumber of amended record

		// Make sure passed rowNumber is in bounds
		if (rowNumber >= disclosureList.length) { revert(); }
		if (rowNumber < 1) { revert(); }
		if (disclosureList[rowNumber].amended > 0) { revert(); }    // This record is already amended

		// First create new entry
		Disclosure memory disclosure;

		disclosure.organization = organization;
		disclosure.recipient = recipient;
		disclosure.location = location;
		disclosure.amount = amount;
		disclosure.fundingType = fundingType;
		disclosure.date = date;
		disclosure.purpose = purpose;
		disclosure.comment = comment;
		disclosure.amended = 0;

		// Push entry to the array
		uint index = disclosureList.push(disclosure);   // adds to end of array (of structs) and returns the new array length
		index = index - 1;

		// Now that we have the newRowNumber (index), set the amended field on the old record
		disclosureList[rowNumber].amended = index;

		// Record the event
		disclosureAdded(index, organization, recipient, location, amount, fundingType, date, purpose, comment);   // a different event for amending?

		return index;   // returning rowNumber of the new record
	}
}