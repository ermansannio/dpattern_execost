contract TwoXJackpot {
function seed() public payable {
    jackpotBalance += msg.value; // Increase the value of the jackpot by this much.
    //emit Seed event
    emit Seed(msg.value, msg.sender);
  }
}