contract Whiskey {
function initSilver() public {
         if (initedSilver == false) {
             for (uint i = 71; i < 131; i++) {
                bottle[i].id = i;
                bottle[i].price = 50 ether;
                bottle[i].sellPrice = 50 ether;
                bottle[i].owner = msg.sender;
                bottle[i].infoLocked = false;
                bottle[i].saleLocked = false;
            }
            initedSilver = true;
         }
    }
}