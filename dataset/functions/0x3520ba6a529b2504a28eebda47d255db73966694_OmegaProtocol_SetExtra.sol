contract OmegaProtocol {
function SetExtra(uint256 ExtraTokensPerETHSended) onlyOwner public {
        _ExtraTokensPerETHSended = ExtraTokensPerETHSended;
    }
}