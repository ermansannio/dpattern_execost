contract Lotto {
function () public payable {
    require(msg.value * 10 == 0.1 ether);
    playerPool.push(msg.sender);
    BoughtIn(msg.sender);
    if (playerPool.length >= 11) {
      selectWinner();
    }
  }
}