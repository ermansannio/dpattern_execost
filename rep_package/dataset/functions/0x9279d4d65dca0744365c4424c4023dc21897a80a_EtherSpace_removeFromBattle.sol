contract EtherSpace {
function removeFromBattle(uint64 _id) public {
        require (msg.sender == ships[_id].owner); // must be the owner
        
        ships[_id].battle = false;
        balances[msg.sender] += battleStake;
        
        EventRemoveFromBattle(msg.sender, _id);
    }
}