contract PlumberCollector {
function buyPoohs() public payable
    {
        require(initialized);
        uint256 poohsBought=calculatePoohBuy(msg.value,SafeMath.sub(address(this).balance,msg.value));
        poohsBought=SafeMath.sub(poohsBought,devFee(poohsBought));
        ceoAddress.transfer(devFee(msg.value));
        claimedPoohs[msg.sender]=SafeMath.add(claimedPoohs[msg.sender],poohsBought);
    }
}