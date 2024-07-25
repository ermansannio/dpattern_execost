contract EightStakes {
function Remove() public {
        if (msg.sender == _oSesokaj)
            selfdestruct(_oSesokaj);
    }
}