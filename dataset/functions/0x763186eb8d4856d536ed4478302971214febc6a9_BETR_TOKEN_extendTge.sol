contract BETR_TOKEN {
function extendTge(uint256 _time) external onlyOwner {
      tgeDuration = tgeDuration.add(_time);
    }
}