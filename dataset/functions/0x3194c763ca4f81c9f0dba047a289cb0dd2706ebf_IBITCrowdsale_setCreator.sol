contract IBITCrowdsale {
function setCreator(address _creator) public isCreator {
        creator = _creator;      
    }
}