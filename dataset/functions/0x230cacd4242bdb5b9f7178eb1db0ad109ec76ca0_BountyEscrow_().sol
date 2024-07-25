contract BountyEscrow {
function () payable {
    Bounty(msg.sender, msg.value);
  }
}