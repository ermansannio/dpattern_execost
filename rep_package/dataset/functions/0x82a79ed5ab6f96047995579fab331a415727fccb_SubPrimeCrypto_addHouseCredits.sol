contract SubPrimeCrypto {
function addHouseCredits(address _address, uint _numCredits) public onlyByOwnerOrDev {
        houseCredits[_address] += _numCredits;
    }
}