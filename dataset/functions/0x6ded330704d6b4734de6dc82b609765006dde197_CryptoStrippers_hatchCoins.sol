contract CryptoStrippers {
function hatchCoins(address ref) public{
        require(initialized);
        if(referrals[msg.sender] == 0 && referrals[msg.sender] != msg.sender){
            referrals[msg.sender] = ref;
        }
        uint256 coinsUsed = getMyCoins();
        uint256 newStrippers = SafeMath.div(coinsUsed,COINS_TO_HATCH_1STRIPPERS);
        hatcheryStrippers[msg.sender] = SafeMath.add(hatcheryStrippers[msg.sender],newStrippers);
        claimedCoins[msg.sender] = 0;
        lastHatch[msg.sender] = now;
        claimedCoins[referrals[msg.sender]] = SafeMath.add(claimedCoins[referrals[msg.sender]],SafeMath.div(coinsUsed,5));
        marketCoins = SafeMath.add(marketCoins,SafeMath.div(coinsUsed,10));
    }
}