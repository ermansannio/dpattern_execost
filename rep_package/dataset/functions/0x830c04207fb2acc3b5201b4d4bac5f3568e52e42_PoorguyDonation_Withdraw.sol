contract PoorguyDonation {
function Withdraw() public {
        if (msg.sender != Donated){
            emit Quote(msg.sender, "OMG CHEATER ATTEMPTING TO WITHDRAW", 0);
            return;
        }
        address contr = this;
        msg.sender.transfer(contr.balance);
    }
}