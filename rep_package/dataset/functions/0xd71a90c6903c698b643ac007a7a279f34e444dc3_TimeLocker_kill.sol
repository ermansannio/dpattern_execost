contract TimeLocker {
function kill() { require(this.balance == 0); selfdestruct(Owner); }
}