contract DABcoin {
function enableICO() {
        if (msg.sender != creator) { revert(); }
        ICO = true;
    }
}