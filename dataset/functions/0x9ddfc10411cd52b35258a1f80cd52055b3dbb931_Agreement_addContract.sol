contract Agreement {
function addContract(
        bytes32 contractTitle, bytes32 documentTitle, bytes32 version,
        bytes32 description, address participant, bytes32 consent
        ) public {
        require(owner == msg.sender);
        contractCount += 1;
        contracts[contractCount] = 
        Contract(contractCount, contractTitle, documentTitle, version, description, participant, consent, false);
        emit ContractCreated(contractCount, participant);
    }
}