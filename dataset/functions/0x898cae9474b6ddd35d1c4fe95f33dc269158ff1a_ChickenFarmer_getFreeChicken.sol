contract ChickenFarmer {
function getFreeChicken() public{
        require(initialized);
        require(hatcheryChicken[msg.sender]==0);
        lastHatch[msg.sender]=now;
        hatcheryChicken[msg.sender]=STARTING_CHICKEN;
    }
}