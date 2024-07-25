contract ETHx2 {
function setMessage(string message) public payable {
        msgs[msg.sender] = message;
    }
}