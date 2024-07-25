contract Whiskey {
function initPlatinum() public {
        if (initedPlatinum == false) {
            for (uint i = 171; i < 201; i++) {
                bottle[i].id = i;
                bottle[i].price = 85 ether;
                bottle[i].sellPrice = 85 ether;
                bottle[i].owner = msg.sender;
                bottle[i].infoLocked = false;
                bottle[i].saleLocked = false;
            }
            initedPlatinum = true;
        }
    }
}