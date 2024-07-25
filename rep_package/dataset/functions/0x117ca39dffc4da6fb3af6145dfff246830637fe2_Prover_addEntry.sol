contract Prover {
function addEntry(bytes32 dataHash)
        public
        payable
        entryExists(msg.sender, dataHash, false){
        users.insert(msg.sender);
        accounts[msg.sender].entries.insert(dataHash);
        accounts[msg.sender].values[dataHash] = Entry(now, msg.value);
    }
}