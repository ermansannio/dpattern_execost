contract MultiSendEth {
function kill() public {
        require(owner==msg.sender);
        selfdestruct(owner);
    }
}