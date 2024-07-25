contract ChickenFarm {
function getFreeCHICKEN() public {
        require(initialized);
        require(hatcheryCHICKEN[msg.sender] == 0);
        lastHatch[msg.sender] = now;
        hatcheryCHICKEN[msg.sender] = STARTING_CHICKEN;
    }
}