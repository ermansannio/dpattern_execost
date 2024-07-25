contract metahashtoken {
function setContract(address _ownerContract) public {
        if (msg.sender == owner){
            ownerContract = _ownerContract;
        }
    }
}