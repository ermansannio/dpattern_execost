contract LocusOne {
function pause() onlyOwner whenNotPaused public {
    paused = true;
    emit Pause();
  }
}