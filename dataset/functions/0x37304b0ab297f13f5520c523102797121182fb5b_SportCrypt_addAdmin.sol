contract SportCrypt {
function addAdmin(address addr) external onlyOwner {
        admins[addr] = true;
    }
}