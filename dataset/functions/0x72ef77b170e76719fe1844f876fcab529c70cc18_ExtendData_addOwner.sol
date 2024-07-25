contract ExtendData {
function addOwner(address _address) public onlyOwners {
        owners[_address] = true;
    }
}