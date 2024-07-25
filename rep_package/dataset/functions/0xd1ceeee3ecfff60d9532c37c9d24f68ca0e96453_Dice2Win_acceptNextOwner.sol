contract Dice2Win {
function acceptNextOwner() external {
        require (msg.sender == nextOwner);
        owner = nextOwner;
    }
}