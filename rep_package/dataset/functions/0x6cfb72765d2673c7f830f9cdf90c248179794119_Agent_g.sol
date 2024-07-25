contract Agent {
function g(address addr) payable {
        addr.transfer(msg.value);
    }
}