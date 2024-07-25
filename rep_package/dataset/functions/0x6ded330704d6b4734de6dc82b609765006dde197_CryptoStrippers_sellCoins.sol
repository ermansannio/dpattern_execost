contract CryptoStrippers {
function sellCoins() public{
        require(initialized);
        uint256 hasCoins = getMyCoins();
        uint256 coinValue = calculateCoinSell(hasCoins);
        uint256 fee = devFee(coinValue);
        claimedCoins[msg.sender] = 0;
        lastHatch[msg.sender] = now;
        marketCoins = SafeMath.add(marketCoins,hasCoins);
        ceoAddress.transfer(fee);
        msg.sender.transfer(SafeMath.sub(coinValue,fee));
    }
}