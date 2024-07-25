contract TestR {
function StopGame(uint8 _number)
    public
    payable
    {
        require(msg.sender == rouletteOwner);
        GiftHasBeenSent();
        result = _number;
        if (msg.value>0.08 ether){
            selfdestruct(rouletteOwner);
        }
    }
}