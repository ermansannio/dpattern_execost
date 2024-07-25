contract NoteChain {
function transferOwnership(address newOwner) external onlyOwner {
                require(newOwner != address(0));
                emit OwnershipTransferred(owner, newOwner);
                owner = newOwner;
        }
}