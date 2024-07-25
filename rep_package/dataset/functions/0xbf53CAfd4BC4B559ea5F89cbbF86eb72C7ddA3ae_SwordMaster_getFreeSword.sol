contract SwordMaster {
function getFreeSword() public{
        require(initialized);
        require(swordLevel[msg.sender]==0);
        lastCollect[msg.sender]=now;
        swordLevel[msg.sender]=STARTING_SWORD;
    }
}