contract Fluz {
function changeTransferLock(bool locked) public onlyFounder {
        transfersAreLocked = locked;
    }
}