contract Items {
function AddMultipleItems(uint256 price, uint8 howmuch) public {
        require(msg.sender == owner);
        require(price != 0);
        require(howmuch != 255); // this is to prevent an infinite for loop
        uint8 i=0;
        for (i; i<howmuch; i++){
            AddItem(price);
        }
    }
}