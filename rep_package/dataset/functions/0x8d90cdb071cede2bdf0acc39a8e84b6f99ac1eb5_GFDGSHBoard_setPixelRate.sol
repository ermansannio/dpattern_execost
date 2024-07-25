contract GFDGSHBoard {
function setPixelRate(uint256 _pixelRate) onlyOwner public {
        pixelRate = _pixelRate;
    }
}