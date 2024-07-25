contract BlackjackTipJar {
function deposit(address dealer) public payable {
      bankrolls[dealer] = bankrolls[dealer] + msg.value;
      emit Deposit(dealer, msg.sender, msg.value);
    }
}