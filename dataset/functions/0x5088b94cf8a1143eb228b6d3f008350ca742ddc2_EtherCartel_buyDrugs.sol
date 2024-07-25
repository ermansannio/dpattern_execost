contract EtherCartel {
function buyDrugs() public payable{
        require(initialized);
        uint256 drugsBought=calculateDrugBuy(msg.value,SafeMath.sub(this.balance,msg.value));
        drugsBought=SafeMath.sub(drugsBought,devFee(drugsBought));
        ceoAddress.transfer(devFee(msg.value));
        claimedDrugs[msg.sender]=SafeMath.add(claimedDrugs[msg.sender],drugsBought);
    }
}