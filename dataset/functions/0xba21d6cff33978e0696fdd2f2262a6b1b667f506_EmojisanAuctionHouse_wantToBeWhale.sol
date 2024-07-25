contract EmojisanAuctionHouse {
function wantToBeWhale() external {
        // need to have more tokens &#128176; than current &#128011;
        require(emojisan.balanceOf(msg.sender) > emojisan.balanceOf(whaleAddress));
        whaleAddress = msg.sender;
        // whale &#128051; needs to wait some time ⏱️ before snatching that sweet &#127852; eth &#129297;
        whaleStartTime = uint32(block.number);
    }
}