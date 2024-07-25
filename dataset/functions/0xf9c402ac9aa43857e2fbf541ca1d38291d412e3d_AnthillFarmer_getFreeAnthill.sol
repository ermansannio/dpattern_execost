contract AnthillFarmer {
function getFreeAnthill() public{
        require(initialized);
        require(Anthills[msg.sender]==0);
        lastCollect[msg.sender]=now;
        Anthills[msg.sender]=STARTING_ANTHILL;
    }
}