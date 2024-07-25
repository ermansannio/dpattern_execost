contract AENCrowdsale {
function setOwner(address _owner) public {
        require(msg.sender == creator);
        owner = _owner;      
    }
}