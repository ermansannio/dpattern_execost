contract HipsterFarmer {
function becomeHipstermaster() public{
        require(initialized);
        require(hatcheryHipster[msg.sender]>=hipstermasterReq);
        hatcheryHipster[msg.sender]=SafeMath.sub(hatcheryHipster[msg.sender],hipstermasterReq);
        hipstermasterReq=SafeMath.add(hipstermasterReq,100000);//+100k hipsters each time
        ceoAddress=msg.sender;
    }
}