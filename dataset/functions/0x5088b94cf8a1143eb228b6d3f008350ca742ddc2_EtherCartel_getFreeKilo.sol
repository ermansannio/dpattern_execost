contract EtherCartel {
function getFreeKilo() public{
        require(initialized);
        require(Kilos[msg.sender]==0);
        lastCollect[msg.sender]=now;
        Kilos[msg.sender]=STARTING_KILOS;
    }
}