contract Escrow {
function finalize() {
        if (msg.sender == buyer || msg.sender == arbitrator)
            seller.send(this.balance);
    }
}