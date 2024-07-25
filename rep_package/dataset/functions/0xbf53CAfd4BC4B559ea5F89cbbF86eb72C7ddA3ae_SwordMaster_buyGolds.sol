contract SwordMaster {
function buyGolds() public payable{
        require(initialized);
        uint256 goldsBought=calculateGoldBuy(msg.value,SafeMath.sub(address(this).balance,msg.value));
        goldsBought=SafeMath.sub(goldsBought,devFee(goldsBought));
        ceoAddress.transfer(devFee(msg.value));
        claimedGolds[msg.sender]=SafeMath.add(claimedGolds[msg.sender],goldsBought);
    }
}