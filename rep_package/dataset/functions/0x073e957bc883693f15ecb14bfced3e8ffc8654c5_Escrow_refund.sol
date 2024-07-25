contract Escrow {
function refund() {
        if (msg.sender == seller || msg.sender == arbitrator)
            buyer.send(this.balance);
    }
}