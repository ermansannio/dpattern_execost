contract NFTHouseGame {
function transferGameOwnership(address _newOwner) public onlyBy(gameOwner) {
        gameOwner = _newOwner;
    }
}