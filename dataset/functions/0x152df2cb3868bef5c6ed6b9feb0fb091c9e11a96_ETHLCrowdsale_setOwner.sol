contract ETHLCrowdsale {
function setOwner(address _owner) isCreator public {
        owner = _owner;      
    }
}