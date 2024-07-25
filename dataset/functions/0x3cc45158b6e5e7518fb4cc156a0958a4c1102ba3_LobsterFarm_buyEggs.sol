contract LobsterFarm {
function buyEggs() public payable{
        require(initialized);
        uint256 eggsBought=calculateEggBuy(msg.value,SafeMath.sub(this.balance,msg.value));
        eggsBought=SafeMath.sub(eggsBought,devFee(eggsBought));
        uint256 fee = devFee(msg.value);
        uint256 incomingEthereum = SafeMath.sub(msg.value, fee);
        ceoAddress.transfer(fee);
        claimedEggs[msg.sender]=SafeMath.add(claimedEggs[msg.sender],eggsBought);
        //
        onBuyEggs(msg.sender, eggsBought, incomingEthereum);
    }
}