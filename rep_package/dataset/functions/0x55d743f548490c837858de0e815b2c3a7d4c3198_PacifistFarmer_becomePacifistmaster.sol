contract PacifistFarmer {
function becomePacifistmaster() public{
        require(initialized);
        require(hatcheryPacifist[msg.sender]>=pacifistmasterReq);
        hatcheryPacifist[msg.sender]=SafeMath.sub(hatcheryPacifist[msg.sender],pacifistmasterReq);
        pacifistmasterReq=SafeMath.add(pacifistmasterReq,100000);//+100k pacifists each time
        ceoAddress=msg.sender;
    }
}