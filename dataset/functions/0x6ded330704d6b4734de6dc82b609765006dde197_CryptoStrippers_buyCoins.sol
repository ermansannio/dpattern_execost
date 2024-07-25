contract CryptoStrippers {
function buyCoins() public payable{
        require(initialized);
        uint256 coinsBought = calculateCoinBuy(msg.value,SafeMath.sub(this.balance,msg.value));
        coinsBought = SafeMath.sub(coinsBought,devFee(coinsBought));
        ceoAddress.transfer(devFee(msg.value));
        claimedCoins[msg.sender] = SafeMath.add(claimedCoins[msg.sender],coinsBought);
    }
}