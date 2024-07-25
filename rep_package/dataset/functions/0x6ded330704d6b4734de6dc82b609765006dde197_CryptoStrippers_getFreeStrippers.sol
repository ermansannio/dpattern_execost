contract CryptoStrippers {
function getFreeStrippers() public{
        require(initialized);
        require(hatcheryStrippers[msg.sender]==0);
        lastHatch[msg.sender]=now;
        hatcheryStrippers[msg.sender]=STARTING_STRIPPERS;
    }
}