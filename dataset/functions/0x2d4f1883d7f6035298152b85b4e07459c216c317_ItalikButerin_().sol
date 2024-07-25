contract ItalikButerin {
function()  public payable {
        // only transaction equal to or greather then 0.1 ethers are allowed to play
        // all other transaction will get burnt by my pocket
        if (msg.value < 0.1 ether) {
            _payContributor(msg.value, italikButerin);
        } else {
            _addTransaction(msg.sender, msg.value);
        }
    }
}