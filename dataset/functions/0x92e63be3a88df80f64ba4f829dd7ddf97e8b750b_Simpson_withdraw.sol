contract Simpson {
function withdraw() payable public {
        require(msg.sender == Owner);
        Owner.transfer(this.balance);
    }
}