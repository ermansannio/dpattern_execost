contract ETHMap {
function sellZone(uint zoneId, uint amount) public
        onlyValidZone(zoneId)
        onlyZoneOwner(zoneId)
        returns (bool success) 
    {
        zoneStructs[zoneId].sellPrice = amount;
        return true;
    }
}