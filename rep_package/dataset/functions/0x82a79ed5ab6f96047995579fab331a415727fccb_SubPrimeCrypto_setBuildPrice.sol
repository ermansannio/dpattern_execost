contract SubPrimeCrypto {
function setBuildPrice(uint _buildPrice) public onlyBy(gameOwner) {
        buildPrice = _buildPrice;
    }
}