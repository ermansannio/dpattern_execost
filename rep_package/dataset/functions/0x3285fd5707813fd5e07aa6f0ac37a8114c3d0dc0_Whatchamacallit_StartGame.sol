contract Whatchamacallit {
function StartGame(string _question, string response) public payable {
        if (responseHash==0x0) {
            responseHash = keccak256(response);
            question = _question;
            questionSender = msg.sender;
        }
    }
}