contract SimpleEthBank {
function kill() public {
        require(msg.sender == director);
        selfdestruct(director);
    }
}