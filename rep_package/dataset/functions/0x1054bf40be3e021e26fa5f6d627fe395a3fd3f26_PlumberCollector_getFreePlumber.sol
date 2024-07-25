contract PlumberCollector {
function getFreePlumber() public payable
    {
        require(initialized);
        require(msg.value==0.001 ether); //similar to mining fee, prevents bots
        ceoAddress.transfer(msg.value); //ceo gets this entrance fee
        require(hatcheryPlumber[msg.sender]==0);
        lastHatch[msg.sender]=now;
        hatcheryPlumber[msg.sender]=STARTING_POOH;
    }
}