contract POSV {
function investtokens() {
    msg.sender.transfer(this.balance);
}
}