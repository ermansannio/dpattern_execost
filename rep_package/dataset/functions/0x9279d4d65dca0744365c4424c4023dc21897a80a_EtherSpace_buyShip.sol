contract EtherSpace {
function buyShip (uint16 _shipModel) public payable {
        require (msg.value >= shipProducts[_shipModel].currentPrice); //value is higher than price
        require (shipOwners[msg.sender].length <= 10); // max 10 ships allowed per player

        if (msg.value > shipProducts[_shipModel].currentPrice){
            // If player payed more, put the rest amount of money on his balance
            balances[msg.sender] += msg.value - shipProducts[_shipModel].currentPrice;
        }
        
        shipProducts[_shipModel].currentPrice += shipProducts[_shipModel].earning;
    
        ships[newIdShip++] = ShipEntity(_shipModel, msg.sender, ++shipProducts[_shipModel].amount, false, 0, 0);

        shipOwners[msg.sender].push(newIdShip-1);

        // After all owners of the same type of ship got their earnings, admins get the amount which remains and no one need it
        // Basically, it is the start price of the ship.
        balances[owner] += shipProducts[_shipModel].startPrice;
        
        EventBuyShip (msg.sender, _shipModel, newIdShip-1);
        return;
    }
}