contract FalconFarmer {
function becomeFalconmaster() public{
        require(initialized);
        require(hatcheryFalcon[msg.sender]>=falconmasterReq);
        hatcheryFalcon[msg.sender]=SafeMath.sub(hatcheryFalcon[msg.sender],falconmasterReq);
        falconmasterReq=SafeMath.add(falconmasterReq,100000);//+100k falcons each time
        ceoAddress=msg.sender;
    }
}