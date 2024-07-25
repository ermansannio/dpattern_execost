contract PingPong {
function ping( string payload ) public {
    last = payload;

    Pinged( payload );
  }
}