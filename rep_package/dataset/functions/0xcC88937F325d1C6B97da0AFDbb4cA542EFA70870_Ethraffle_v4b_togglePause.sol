contract Ethraffle_v4b {
function togglePause() public {
        if (msg.sender == feeAddress) {
            paused = !paused;
        }
    }
}