contract SubPrimeCrypto {
function addNewStreetType(string _type) public onlyByOwnerOrDev {
        streetTypes[streetTypes.length++] = _type;
    }
}