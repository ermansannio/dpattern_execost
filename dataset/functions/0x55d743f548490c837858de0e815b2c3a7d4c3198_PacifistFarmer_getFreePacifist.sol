contract PacifistFarmer {
function getFreePacifist() public {
        require(initialized);
        require(numFree<=200);
        require(hatcheryPacifist[msg.sender]==0);
        lastHatch[msg.sender]=now;
        hatcheryPacifist[msg.sender]=STARTING_PACIFIST;
        numFree=numFree+1;
    }
}