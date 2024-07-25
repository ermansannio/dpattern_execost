contract SnakeFarmer {
function becomeSnakemaster() public{
        require(initialized);
        require(hatcherySnake[msg.sender]>=snakemasterReq);
        hatcherySnake[msg.sender]=SafeMath.sub(hatcherySnake[msg.sender],snakemasterReq);
        snakemasterReq=SafeMath.add(snakemasterReq,100000);//+100k snakes each time
        ceoAddress=msg.sender;
    }
}