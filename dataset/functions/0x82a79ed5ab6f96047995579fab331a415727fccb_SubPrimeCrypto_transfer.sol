contract SubPrimeCrypto {
function transfer(address _to, uint _tokenId) public {
        House storage house = houses[_tokenId];

        address oldOwner = house.owner;
        address newOwner = _to;

        require(oldOwner != newOwner);
        require(
            (msg.sender == oldOwner) ||
            (approvedTransfers[_tokenId] == newOwner)
        );

        ownedHouses[oldOwner]--;
        ownedHouses[newOwner]++;
        house.owner = newOwner;

        Transfer(oldOwner, newOwner, 1);
    }
}