contract TurtleFarmer {
function becomeTurtlemaster() public{
        require(initialized);
        require(hatcheryTurtle[msg.sender]>=turtlemasterReq);
        hatcheryTurtle[msg.sender]=SafeMath.sub(hatcheryTurtle[msg.sender],turtlemasterReq);
        turtlemasterReq=SafeMath.add(turtlemasterReq,100000);//+100k turtles each time
        ceoAddress=msg.sender;
    }
}