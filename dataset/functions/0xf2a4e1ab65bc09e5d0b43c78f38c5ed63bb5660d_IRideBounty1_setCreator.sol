contract IRideBounty1 {
function setCreator(address _creator) isCreator public {
        creator = _creator;      
    }
}