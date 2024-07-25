contract MyEtherCityGame {
function UpdateInitiateContractAddress(address _newAddress) public onlyCeo { 
        InitiateLandsAddress = _newAddress;
    }
}