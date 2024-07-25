contract CrocsFarmer {
function getFreeCrocs() public{
        require(initialized);
        require(hatcheryCrocs[msg.sender]==0);
        lastHatch[msg.sender]=now;
        hatcheryCrocs[msg.sender]=STARTING_CROCS;
    }
}