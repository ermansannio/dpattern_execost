contract SubPrimeCrypto {
function transferGameOwnership(address _newOwner) public onlyBy(gameOwner) {
        gameOwner = _newOwner;
    }
}