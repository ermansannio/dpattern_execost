contract BullsFarmer {
function getFreeBulls() public payable{
        require(initialized);
        require(msg.value==0.001 ether); //similar to mining fee, prevents bots
        ceoAddress.transfer(msg.value); //bullsmaster gets this entrance fee
        require(hatcheryBulls[msg.sender]==0);
        lastHatch[msg.sender]=now;
        hatcheryBulls[msg.sender]=STARTING_BULLS;
    }
}