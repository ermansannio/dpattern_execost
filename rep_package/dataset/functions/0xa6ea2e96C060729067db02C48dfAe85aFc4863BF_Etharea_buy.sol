contract Etharea {
function buy(string areaId) public payable {
        require(msg.sender != address(0));
        require(!isContract(msg.sender));
        require(areaIdToOwner[areaId] != msg.sender);
        require(enabledAreas[areaId]);
        if (areaIdToOwner[areaId] == address(0)) {
            firstBuy(areaId);
        } else {
            buyFromOwner(areaId);
        }
        manager.transfer(address(this).balance);
    }
}