contract PlayCryptoGaming {
function updateCryptoGamerVerifiedAddress(uint _cryptoGamerId, address _newAddress) public onlyOwner {
        cryptoGamers[_cryptoGamerId].CryptoGamerAddress = _newAddress;
    }
}