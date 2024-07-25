contract DEMS {
function sendMessage(bytes iv, bytes epk, bytes ct, bytes mac) external {
        SendMessage(iv, epk, ct, mac, msg.sender);
    }
}