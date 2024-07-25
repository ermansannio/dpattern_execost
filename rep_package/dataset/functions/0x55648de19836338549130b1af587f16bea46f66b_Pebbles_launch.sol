contract Pebbles {
function launch() public {
        require(msg.sender == founder);
        launched = block.timestamp;
        founder = 0x0;
    }
}