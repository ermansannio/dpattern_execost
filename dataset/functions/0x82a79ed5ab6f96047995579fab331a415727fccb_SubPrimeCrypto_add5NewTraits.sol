contract SubPrimeCrypto {
function add5NewTraits(string _one, string _two, string _three, string _four, string _five, bool _isNegative) public onlyByOwnerOrDev {
        addNewTrait(_one, _isNegative);
        addNewTrait(_two, _isNegative);
        addNewTrait(_three, _isNegative);
        addNewTrait(_four, _isNegative);
        addNewTrait(_five, _isNegative);
    }
}