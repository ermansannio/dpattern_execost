contract EthOwls {
function becomeOwlmaster() public{
        require(initialized);
        require(hatcheryShrimp[msg.sender]>=owlmasterReq);
        hatcheryShrimp[msg.sender]=SafeMath.sub(hatcheryShrimp[msg.sender],owlmasterReq);
        owlmasterReq=SafeMath.add(owlmasterReq,100000);//+100k owls each time
        ceoAddress=msg.sender;
    }
}