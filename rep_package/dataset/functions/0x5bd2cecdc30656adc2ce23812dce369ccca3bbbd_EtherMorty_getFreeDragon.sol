contract EtherMorty {
function getFreeDragon() public {
        require(initialized);
        require(normalDragon[msg.sender] == 0);
        
        lastHatch[msg.sender]=now;
        normalDragon[msg.sender]=STARTING_Dragon;
        setUserHatchRate();
    }
}