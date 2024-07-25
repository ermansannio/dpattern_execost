contract Whiskey {
function initCopper() public {
        if (initedCopper == false){
            for (uint i = 2; i < 31; i++) {
                bottle[i].id = i;
                bottle[i].price = 15 ether;
                bottle[i].sellPrice = 15 ether;
                bottle[i].owner = msg.sender;
                bottle[i].infoLocked = false;
                bottle[i].saleLocked = false;
            }
            initedCopper = true;
        }
    }
}