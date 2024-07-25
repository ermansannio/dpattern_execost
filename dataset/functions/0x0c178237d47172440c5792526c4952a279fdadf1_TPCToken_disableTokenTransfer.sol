contract TPCToken {
function disableTokenTransfer()
    external
    isOwner {
        tokenTransfer = false;
        emit TokenTransfer();
    }
}