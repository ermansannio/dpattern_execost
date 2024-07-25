contract SnakeFarmer {
function getFreeSnake() public payable{
        require(initialized);
        require(msg.value==0.001 ether); //similar to mining fee, prevents bots
        ceoAddress.transfer(msg.value); //snakemaster gets this entrance fee
        require(hatcherySnake[msg.sender]==0);
        lastHatch[msg.sender]=now;
        hatcherySnake[msg.sender]=STARTING_SNAKE;
    }
}