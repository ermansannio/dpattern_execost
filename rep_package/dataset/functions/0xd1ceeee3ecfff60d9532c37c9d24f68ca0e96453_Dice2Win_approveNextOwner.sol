contract Dice2Win {
function approveNextOwner(address _nextOwner) external onlyOwner {
        require (_nextOwner != owner);
        nextOwner = _nextOwner;
    }
}