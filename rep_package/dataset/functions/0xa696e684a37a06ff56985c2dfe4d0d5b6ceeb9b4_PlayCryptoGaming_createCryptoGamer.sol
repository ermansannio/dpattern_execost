contract PlayCryptoGaming {
function createCryptoGamer(string _cryptoGamerName, uint256 _cryptoGamerPrice, address _verifiedAddress) public onlyOwner {
        cryptoGamers.push(CryptoGamer(_cryptoGamerName, address(this), _cryptoGamerPrice, _verifiedAddress));
    }
}