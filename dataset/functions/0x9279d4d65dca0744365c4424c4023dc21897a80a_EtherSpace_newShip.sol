contract EtherSpace {
function newShip (uint16 _class, uint256 _price, uint256 _earning) public {
        require (owner == msg.sender);
        
        shipProducts[newModelShipProduct++] = ShipProduct(_class, _price, _price, _earning, 0);
    }
}