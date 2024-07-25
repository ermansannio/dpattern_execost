contract HipsterFarmer {
function getFreeHipster() public payable{
        require(initialized);
        require(msg.value==0.001 ether); 
        ceoAddress.transfer(msg.value); 
        require(hatcheryHipster[msg.sender]==0);
        lastHatch[msg.sender]=now;
        hatcheryHipster[msg.sender]=STARTING_HIPSTER;
    }
}