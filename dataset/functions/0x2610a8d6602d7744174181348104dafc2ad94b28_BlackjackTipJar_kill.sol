contract BlackjackTipJar {
function kill() public auth {
      selfdestruct(pitboss);
    }
}