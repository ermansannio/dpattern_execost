contract PinCodeMoneyStorage {
function Withdraw() public {
        require(msg.sender == Owner);
        Owner.transfer(this.balance);
    }
}