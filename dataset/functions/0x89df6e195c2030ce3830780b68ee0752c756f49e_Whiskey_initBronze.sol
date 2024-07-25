contract Whiskey {
function initBronze() public {
        if (initedBronze == false) {
            for (uint i = 31; i < 71; i++) {
                bottle[i].id = i;
                bottle[i].price = 35 ether;
                bottle[i].sellPrice = 35 ether;
                bottle[i].owner = msg.sender;
                bottle[i].infoLocked = false;
                bottle[i].saleLocked = false;
            }
            initedBronze = true;
        }
    }
}