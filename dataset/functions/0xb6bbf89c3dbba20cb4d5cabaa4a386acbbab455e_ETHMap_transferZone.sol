contract ETHMap {
function transferZone(uint zoneId, address recipient) public
        onlyValidZone(zoneId)
        onlyZoneOwner(zoneId)
        returns (bool success) 
    {
        zoneStructs[zoneId].owner = recipient;
        return true;
    }
}