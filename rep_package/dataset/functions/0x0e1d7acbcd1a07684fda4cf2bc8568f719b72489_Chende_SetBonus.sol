contract Chende {
function SetBonus(uint256 BonusTokensPerETHdonated) onlyOwner public {
        _BonusTokensPerETHdonated = BonusTokensPerETHdonated;
    }
}