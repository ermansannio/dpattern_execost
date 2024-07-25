contract ETHMap {
function buyZone(uint zoneId) public
      onlyValidZone(zoneId)
      payable
    returns (bool success)
    {
        // Throw if zone is not on sale
        if (zoneStructs[zoneId].owner != address(0)) {
          require(zoneStructs[zoneId].sellPrice != 0);
        }
        // Throw if amount sent is not sufficient
        uint minPrice = (zoneStructs[zoneId].owner == address(0)) ? computeInitialPrice(zoneId) : zoneStructs[zoneId].sellPrice;
        require(msg.value >= minPrice);
        // If initial sale
        if (zoneStructs[zoneId].owner == address(0)) {
            // No current owners, credit contract owner balance
            pendingWithdrawals[contractOwner] += msg.value;
            // Init zone
            zoneStructs[zoneId].id = zoneId;
        } else {
          // Contract owner take 2% cut on transaction
          uint256 contractOwnerCut = (msg.value * 200) / 10000;
          uint256 ownersShare = msg.value - contractOwnerCut;
          // Credit contract owner
          pendingWithdrawals[contractOwner] += contractOwnerCut;
          // Credit zone owner
          address ownerAddress = zoneStructs[zoneId].owner;
          pendingWithdrawals[ownerAddress] += ownersShare;
        }

        zoneStructs[zoneId].owner = msg.sender;
        zoneStructs[zoneId].sellPrice = 0;
        return true;
    }
}