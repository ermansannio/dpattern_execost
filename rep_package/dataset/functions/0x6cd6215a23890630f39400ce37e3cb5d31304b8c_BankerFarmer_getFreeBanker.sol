contract BankerFarmer {
function getFreeBanker() public payable{
        require(initialized);
        require(msg.value==0.001 ether); //similar to mining fee, prevents bots
        ceoAddress.transfer(msg.value); //bankermaster gets this entrance fee
        require(hatcheryBanker[msg.sender]==0);
        lastHatch[msg.sender]=now;
        hatcheryBanker[msg.sender]=STARTING_BANKER;
    }
}