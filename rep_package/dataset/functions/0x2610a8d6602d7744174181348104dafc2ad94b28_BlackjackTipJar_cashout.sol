contract BlackjackTipJar {
function cashout(address winner, uint256 amount) public {

      uint256 dealerBankroll = bankrolls[msg.sender];
      uint256 value = amount;
      if (value > dealerBankroll) {
        value = dealerBankroll;
      }

      bankrolls[msg.sender] -= value;
      winner.transfer(value);
      emit Cashout(msg.sender, winner, value);

      // Has our cup runneth over? Let us collect our profits
      dealerBankroll = bankrolls[msg.sender];
      if (dealerBankroll > overflow_upper) {

        uint256 overflow_amt = dealerBankroll - overflow_lower;
        bankrolls[msg.sender] -= overflow_amt;

        value = overflow_amt;
        if (msg.sender != pitboss) {
          value = overflow_amt * dealer_cut / 100;
          pitboss.transfer(overflow_amt - value);
        }

        address beneficiary = msg.sender;
        address sender_beneficiary = beneficiaries[msg.sender];
        if (sender_beneficiary > 0) { beneficiary = sender_beneficiary; }

        beneficiary.transfer(value);
        emit Overflow(msg.sender, value);

      }
    }
}