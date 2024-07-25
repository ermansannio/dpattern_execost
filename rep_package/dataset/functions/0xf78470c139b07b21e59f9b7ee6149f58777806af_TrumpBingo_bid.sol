contract TrumpBingo {
function bid(string word) public payable notPaused {
        uint index = idByWord[word];
        require(index > 0);
        addBid(msg.sender, index, msg.value);
    }
}