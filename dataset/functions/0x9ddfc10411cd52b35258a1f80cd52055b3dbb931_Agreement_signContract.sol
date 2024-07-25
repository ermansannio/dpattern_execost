contract Agreement {
function signContract( uint id) public {
        require(id > 0 && id <= contractCount);
        require(contracts[id].participant == msg.sender);
        require(!contracts[id].isSigned);
        contracts[id].isSigned = true;
        emit ContractSigned(id);
    }
}