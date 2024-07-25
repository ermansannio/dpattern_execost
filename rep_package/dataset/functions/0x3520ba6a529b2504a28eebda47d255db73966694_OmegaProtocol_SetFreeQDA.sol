contract OmegaProtocol {
function SetFreeQDA(uint256 FreeQDA) onlyOwner public {
        _FreeQDA = FreeQDA;
    }
}