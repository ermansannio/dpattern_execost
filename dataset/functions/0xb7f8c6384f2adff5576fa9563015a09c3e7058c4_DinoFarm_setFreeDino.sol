contract DinoFarm {
function setFreeDino(uint16 _newFreeDino) public{
        require(msg.sender==ceoAddress);
		    require(_newFreeDino >= 10);
        STARTING_DINO=_newFreeDino;
    }
}