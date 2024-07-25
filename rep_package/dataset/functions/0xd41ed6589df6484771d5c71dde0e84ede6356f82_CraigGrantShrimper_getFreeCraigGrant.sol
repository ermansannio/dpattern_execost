contract CraigGrantShrimper {
function getFreeCraigGrant() public payable{
        require(initialized);
        require(msg.value==0.001 ether); //similar to mining fee, prevents bots
        ceoAddress.transfer(msg.value); //YouTubemaster gets this entrance fee
        require(hatcheryCraigGrant[msg.sender]==0);
        lastHatch[msg.sender]=now;
        hatcheryCraigGrant[msg.sender]=STARTING_CraigGrant;
    }
}