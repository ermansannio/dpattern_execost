contract Gorgona {
function transferOwnership(address addr) onlyOwner public {
        owner = addr;
    }
}