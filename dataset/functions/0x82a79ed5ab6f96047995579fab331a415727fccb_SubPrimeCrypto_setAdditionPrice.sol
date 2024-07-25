contract SubPrimeCrypto {
function setAdditionPrice(uint _additionPrice) public onlyBy(gameOwner) {
        additionPrice = _additionPrice;
    }
}