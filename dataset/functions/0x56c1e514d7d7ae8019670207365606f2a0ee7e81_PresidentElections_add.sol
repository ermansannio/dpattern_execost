contract PresidentElections {
function add(uint32 candidate) public payable voteIsOn returns (bool) {
    require(msg.value == create_price);

    _add(candidate, msg.sender);

    owner.transfer(msg.value);

    return true;
  }
}