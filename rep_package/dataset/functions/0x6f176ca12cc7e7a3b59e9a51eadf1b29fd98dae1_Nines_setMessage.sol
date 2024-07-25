contract Nines {
function setMessage(string message) public payable {
    msgs[msg.sender] = message;
  }
}