contract TBECrowdsale {
function addToCategorie1(address _address) isCreator public {
        categorie1[_address] = true;
    }
}