contract IRideEarlyBuyerBonus {
function setCreator(address _creator) isCreator public {
        creator = _creator;      
    }
}