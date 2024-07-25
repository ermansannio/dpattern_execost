contract ThanahCoin {
function issue(address _to) {

        _mintCoins();

        uint issuedCoins = availableSupply / 100;

        availableSupply -= issuedCoins;
        balanceOf[_to] += issuedCoins;

        Transfer(0, _to, issuedCoins);

    }
}