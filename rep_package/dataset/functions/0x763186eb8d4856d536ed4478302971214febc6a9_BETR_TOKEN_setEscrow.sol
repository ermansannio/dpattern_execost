contract BETR_TOKEN {
function setEscrow(address _escrow) external onlyOwner {
        escrow = _escrow;
    }
}