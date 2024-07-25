contract Whiskey {
function initGold() public {
         if (initedGold == false) {
             for (uint i = 131; i < 171; i++) {
                bottle[i].id = i;
                bottle[i].price = 65 ether;
                bottle[i].sellPrice = 65 ether;
                bottle[i].owner = msg.sender;
                bottle[i].infoLocked = false;
                bottle[i].saleLocked = false;
            }
            initedGold = true;    
        }
    }
}