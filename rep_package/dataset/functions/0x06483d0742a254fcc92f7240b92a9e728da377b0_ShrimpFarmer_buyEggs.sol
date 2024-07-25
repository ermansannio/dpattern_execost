contract ShrimpFarmer {
function buyEggs() public payable{
        require(initialized);
        uint256 eggsBought=calculateEggBuy(msg.value,SafeMath.sub(address(this).balance,msg.value));
        eggsBought=SafeMath.sub(eggsBought,devFee(eggsBought));
        // To save on fees put devFee in a pot to be removed by ceo instead of per transaction
        // Old function: ceoAddress.transfer(devFee(msg.value));
        ceoDevfund += devFee(msg.value);
        claimedEggs[msg.sender]=SafeMath.add(claimedEggs[msg.sender],eggsBought);
    }
}