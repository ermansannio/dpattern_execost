contract MyMap {
function setValue(bytes32 a, bytes15 b) public {
        if(owner == msg.sender) {
            map[a] = b;
        }
    }
}