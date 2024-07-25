contract EtheremonTrade {
function setContract(address _dataContract, address _battleContract) onlyModerators public {
        dataContract = _dataContract;
        battleContract = _battleContract;
    }
}