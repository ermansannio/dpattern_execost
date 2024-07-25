contract EtherMango {
function WithdrawFees() public payable {
        require(msg.sender == owner);
        owner.transfer(this.balance);
    }
}