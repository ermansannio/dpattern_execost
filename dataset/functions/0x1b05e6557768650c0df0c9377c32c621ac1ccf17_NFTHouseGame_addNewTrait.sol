contract NFTHouseGame {
function addNewTrait(string _name, bool _isNegative) public onlyByOwnerOrDev {
        uint traitId = traits.length++;
        traits[traitId].name = _name;
        traits[traitId].isNegative = _isNegative;
    }
}