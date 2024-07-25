contract eth666 {
function setPartner(address newPartner) external onlyOwner {
        partner = newPartner;
    }
}