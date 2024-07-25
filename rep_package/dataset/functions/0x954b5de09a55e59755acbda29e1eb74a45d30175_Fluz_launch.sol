contract Fluz {
function launch() public onlyFounder {
        launched = block.timestamp;
        founder = 0x0;
    }
}