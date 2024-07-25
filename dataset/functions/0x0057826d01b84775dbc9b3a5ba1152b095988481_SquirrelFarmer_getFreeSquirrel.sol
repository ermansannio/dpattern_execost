contract SquirrelFarmer {
function getFreeSquirrel() public payable{
        require(initialized);
        require(msg.value==0.001 ether); //similar to mining fee, prevents bots
        ceoAddress.transfer(msg.value); //squirrelmaster gets this entrance fee
        require(hatcherySquirrel[msg.sender]==0);
        lastHatch[msg.sender]=now;
        hatcherySquirrel[msg.sender]=STARTING_SQUIRREL;
    }
}