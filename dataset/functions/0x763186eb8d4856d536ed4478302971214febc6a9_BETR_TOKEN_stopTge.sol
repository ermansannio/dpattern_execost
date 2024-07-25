contract BETR_TOKEN {
function stopTge(bool _restart) external onlyOwner {
      tgeActive = false;
      if(_restart) tgeStartTime = 0;
    }
}