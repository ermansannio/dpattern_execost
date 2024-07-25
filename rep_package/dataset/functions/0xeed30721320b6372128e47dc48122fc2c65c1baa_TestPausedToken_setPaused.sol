contract TestPausedToken {
function setPaused(bool _paused) public {
    if (msg.sender == owner) {
        paused = _paused;
    }
  }
}