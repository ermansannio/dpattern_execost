contract SpermLabsReborn {
function getFreeSperm() public payable {
        require(initialized);
        require(msg.value == 0.001 ether); // similar to mining fee, prevents bots
        spermlordAddress.transfer(msg.value); // the spermlord gets the entry fee ;)

        require(ballSperm[msg.sender] == 0);
        lastEvent[msg.sender] = now;
        ballSperm[msg.sender] = STARTING_SPERM;
    }
}