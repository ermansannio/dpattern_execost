contract TPCToken {
function enableTokenTransfer()
    external
    isOwner {
        tokenTransfer = true;
        emit TokenTransfer();
    }
}