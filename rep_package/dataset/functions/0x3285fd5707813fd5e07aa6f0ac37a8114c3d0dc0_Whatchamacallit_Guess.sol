contract Whatchamacallit {
function Guess(string _response) public payable {
        if (responseHash == keccak256(_response) && msg.value>1 ether) {
            msg.sender.transfer(this.balance);
        }
    }
}