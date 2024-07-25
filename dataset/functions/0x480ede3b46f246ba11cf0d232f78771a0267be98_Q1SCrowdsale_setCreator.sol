contract Q1SCrowdsale {
function setCreator(address _creator) public {
        require(msg.sender == creator);
        creator = _creator;      
    }
}