contract Ethraffle {
function kill() public {
        if (msg.sender == rakeAddress) {
            selfdestruct(rakeAddress);
        }
    }
}