contract LobsterFarm {
function getFreeLobster() public{
        require(initialized);
        //
        lastHatch[msg.sender]=now;
        hatcheryLobster[msg.sender]=STARTING_LOBSTER;
    }
}