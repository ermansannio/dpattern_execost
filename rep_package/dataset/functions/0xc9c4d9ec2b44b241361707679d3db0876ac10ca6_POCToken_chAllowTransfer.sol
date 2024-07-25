contract POCToken {
function chAllowTransfer(bool _allowTransfer) public onlyOwner {
        allowTransfer = _allowTransfer;
    }
}