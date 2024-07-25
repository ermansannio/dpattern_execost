contract Etharea {
function enableArea(string areaId) public onlyOwner {
        require(!enabledAreas[areaId]);
        enabledAreas[areaId] = true;
    }
}