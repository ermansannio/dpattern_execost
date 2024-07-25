contract DinoFarm {
function getFreeDino() public{
        require(initialized);
        require(hatcheryDino[msg.sender]==0);
        lastHatch[msg.sender]=now;
        hatcheryDino[msg.sender]=STARTING_DINO;
    }
}