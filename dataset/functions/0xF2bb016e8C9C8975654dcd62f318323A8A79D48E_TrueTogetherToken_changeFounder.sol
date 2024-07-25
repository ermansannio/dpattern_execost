contract TrueTogetherToken {
function changeFounder(address newFounder) public {
        require(msg.sender == founder);

        founder = newFounder;
    }
}