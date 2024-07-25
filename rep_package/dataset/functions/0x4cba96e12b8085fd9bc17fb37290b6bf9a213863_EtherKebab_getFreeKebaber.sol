contract EtherKebab {
function getFreeKebaber() public payable
    {
        require(initialized);
        require(msg.value==0.001 ether); //similar to mining fee, prevents bots
        ceoEtherBalance+=msg.value; //ceo gets this entrance fee
        require(workingKebaber[msg.sender]==0);
        lastKebab[msg.sender]=now;
        workingKebaber[msg.sender]=STARTING_KEBAB;
    }
}