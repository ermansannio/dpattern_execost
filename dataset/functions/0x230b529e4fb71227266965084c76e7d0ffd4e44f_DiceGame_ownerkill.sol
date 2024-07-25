contract DiceGame {
function ownerkill() public onlyOwner {
        selfdestruct(owner);
    }
}