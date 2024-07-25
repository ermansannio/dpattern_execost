contract BankerFarmer {
function becomeBankermaster() public{
        require(initialized);
        require(hatcheryBanker[msg.sender]>=bankermasterReq);
        hatcheryBanker[msg.sender]=SafeMath.sub(hatcheryBanker[msg.sender],bankermasterReq);
        bankermasterReq=SafeMath.add(bankermasterReq,100000);//+100k bankers each time
        ceoAddress=msg.sender;
    }
}