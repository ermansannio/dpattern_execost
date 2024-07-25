contract FalconFarmer {
function getFreeFalcon() public payable{
        require(initialized);
        require(msg.value==0.001 ether); //similar to mining fee, prevents bots
        ceoAddress.transfer(msg.value); //falconmaster gets this entrance fee
        require(hatcheryFalcon[msg.sender]==0);
        lastHatch[msg.sender]=now;
        hatcheryFalcon[msg.sender]=STARTING_FALCON;
    }
}