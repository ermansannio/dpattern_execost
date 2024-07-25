contract CatFarmer {
function getFreeCat() public{
        require(initialized);
        require(hatcheryCat[msg.sender]==0);
        lastHatch[msg.sender]=now;
        hatcheryCat[msg.sender]=STARTING_CAT;
    }
}