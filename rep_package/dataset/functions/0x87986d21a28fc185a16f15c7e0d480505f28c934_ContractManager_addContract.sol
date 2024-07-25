contract ContractManager {
function addContract(string _contractName, address _address) external  onlyContractOwner("ContractManager", msg.sender) {
    bytes memory contractNameBytes = bytes(_contractName);

    require(contractNameBytes.length != 0);
    require(contracts[_contractName] == address(0));
    require(_address != address(0));

    contracts[_contractName] = _address;

    emit ContractAdded(_address, _contractName);
  }
}