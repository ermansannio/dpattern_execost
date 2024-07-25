contract PingPong {
function pong() public {
    pong_count += 1;

    Ponged( pong_count, last );
  }
}