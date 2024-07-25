contract FairyFarmer {
function becomeFairymaster() public{
        require(initialized);
        require(hatcheryFairy[msg.sender]>=fairymasterReq);
        hatcheryFairy[msg.sender]=SafeMath.sub(hatcheryFairy[msg.sender],fairymasterReq);
        fairymasterReq=SafeMath.add(fairymasterReq,100000);//+100k fairys each time
        ceoAddress=msg.sender;
    }
}