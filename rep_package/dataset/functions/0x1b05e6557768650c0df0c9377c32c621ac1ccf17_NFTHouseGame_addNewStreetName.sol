contract NFTHouseGame {
function addNewStreetName(string _name) public onlyByOwnerOrDev {
        streetNames[streetNames.length++] = _name;
    }
}