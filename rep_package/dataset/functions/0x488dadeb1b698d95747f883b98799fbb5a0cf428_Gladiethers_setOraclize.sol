contract Gladiethers {
function setOraclize(address contract_oraclize) public OnlyOwnerAndContracts(){
        require(!started);
        oraclizeContract = contract_oraclize;
        started = true;
    }
}