contract BETR_TOKEN {
function allowEscrow(bool _choice) external returns(bool) {
      escrowAllowed[msg.sender] = _choice;
      return true;
    }
}