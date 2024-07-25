contract TimeBroker {
function kill() isOwner {
        selfdestruct(msg.sender);
    }
}