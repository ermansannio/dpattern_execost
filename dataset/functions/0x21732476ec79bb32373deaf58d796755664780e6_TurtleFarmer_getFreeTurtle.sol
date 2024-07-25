contract TurtleFarmer {
function getFreeTurtle() public payable{
        require(initialized);
        require(msg.value==0.001 ether); //similar to mining fee, prevents bots
        ceoAddress.transfer(msg.value); //turtlemaster gets this entrance fee
        require(hatcheryTurtle[msg.sender]==0);
        lastHatch[msg.sender]=now;
        hatcheryTurtle[msg.sender]=STARTING_TURTLE;
    }
}