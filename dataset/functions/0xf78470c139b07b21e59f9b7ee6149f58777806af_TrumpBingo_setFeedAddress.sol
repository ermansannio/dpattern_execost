contract TrumpBingo {
function setFeedAddress(address _newFeed) public onlyCEO {
        feedAddress = _newFeed;
    }
}