contract DocumentStore {
function store(bytes32 document, bytes32 party1, bytes32 party2) public {
        Store(document, party1, party2);
    }
}