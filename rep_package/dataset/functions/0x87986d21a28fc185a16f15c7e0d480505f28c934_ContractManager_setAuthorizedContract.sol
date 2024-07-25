contract ContractManager {
function setAuthorizedContract(string _contractName, address _authorizedAddress, bool _authorized) external onlyContractOwner("ContractManager", msg.sender) {
    bytes memory contractNameBytes = bytes(_contractName);

    require(contractNameBytes.length != 0);
    require(_authorizedAddress != address(0));
    require(authorization[_contractName][_authorizedAddress] != _authorized);
    
    authorization[_contractName][_authorizedAddress] = _authorized;

    emit AuthorizationChanged(_authorizedAddress, _authorized, _contractName);
  }
}