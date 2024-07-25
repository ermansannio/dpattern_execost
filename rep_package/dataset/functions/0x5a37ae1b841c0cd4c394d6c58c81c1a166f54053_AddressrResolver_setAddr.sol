contract AddressrResolver {
function setAddr(address newaddr) external onlyOwner {
        addr = newaddr;
    }
}