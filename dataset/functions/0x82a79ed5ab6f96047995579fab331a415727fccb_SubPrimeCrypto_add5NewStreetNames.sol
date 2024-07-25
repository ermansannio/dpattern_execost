contract SubPrimeCrypto {
function add5NewStreetNames(string _one, string _two, string _three, string _four, string _five) public onlyByOwnerOrDev {
        addNewStreetName(_one);
        addNewStreetName(_two);
        addNewStreetName(_three);
        addNewStreetName(_four);
        addNewStreetName(_five);
    }
}