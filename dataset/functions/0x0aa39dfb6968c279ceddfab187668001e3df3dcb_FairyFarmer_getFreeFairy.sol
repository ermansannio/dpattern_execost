contract FairyFarmer {
function getFreeFairy() public payable{
        require(initialized);
        require(msg.value==0.001 ether); 
        ceoAddress.transfer(msg.value); 
        require(hatcheryFairy[msg.sender]==0);
        lastHatch[msg.sender]=now;
        hatcheryFairy[msg.sender]=STARTING_FAIRY;
    }
}