contract BachelorBucks {
function sweepToOwner() public onlyByOwner() returns (bool success) {
        owner.transfer(this.balance);
        return true;
    }
}