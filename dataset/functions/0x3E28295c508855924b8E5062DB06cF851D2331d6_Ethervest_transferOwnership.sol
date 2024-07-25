contract Ethervest {
function transferOwnership(address addr) onlyOwner public {
        owner = addr;
    }
}