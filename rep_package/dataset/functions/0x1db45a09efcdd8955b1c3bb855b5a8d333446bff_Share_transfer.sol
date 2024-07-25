contract Share {
function transfer(address to, uint amount) public notPaused {
        require(holds[msg.sender] >= amount);
        transferHolds(msg.sender, to, amount);
        
        emit SEND_HOLDS(msg.sender, to, amount);
    }
}