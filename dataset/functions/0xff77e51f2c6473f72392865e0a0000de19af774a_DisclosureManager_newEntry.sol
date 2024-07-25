contract DisclosureManager {
function newEntry(bytes32 organization,
					  bytes32 recipient,
					  bytes32 location,
					  bytes16 amount,
					  bytes1 fundingType,
					  bytes16 date,
					  bytes32 purpose,
					  bytes32 comment) public isOwner() returns(uint rowNumber) {    // should this be public? yes, only needed isOwner()

		// Initialize disclosureList here as needed by putting an empty record at row 0
		// The first entry starts at 1 and getListCount will be in accordance with the record count
		if (disclosureList.length == 0) {
			// Push an empty Entry
			Disclosure memory nullEntry;
			disclosureList.push(nullEntry);
		}

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

		// Record the event
		disclosureAdded(index, organization, recipient, location, amount, fundingType, date, purpose, comment);

		return index;   // returning rowNumber of the record
	}
}