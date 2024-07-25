contract TopIvy {
function buyVotes(uint8 _id) public payable {
      // Ensure at least one vote can be purchased
      require(msg.value >= voteCost);
      // Ensure vote is only for listed Ivys
      require(_id >= 0 && _id <= 7);
      // Calculate number of votes
      uint256 votes = msg.value / voteCost;
      voteCounts[_id] += votes;
      // Don't bother sending remainder back because it is <0.001 eth
  }
}