contract WallCryptoStreet {
function updateSharePrice(uint _shareId, uint256 _newPrice) public {
        require(_newPrice > 0);
        require(shares[_shareId].ownerAddress == msg.sender);
        require(_newPrice < shares[_shareId].curPrice);
        shares[_shareId].curPrice = _newPrice;
    }
}