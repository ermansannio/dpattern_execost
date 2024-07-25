contract NBACrypto {
function addPlayer(string name, address address1, uint256 price, uint256 realTeamId) public onlyCeo {
        players.push(Player(name,address1,price,realTeamId));
    }
}