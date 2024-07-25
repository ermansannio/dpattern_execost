contract Emoz {
function buy(uint256 c, string url) external payable {
  uint256 p = prcs[c];
  if(p == 0) p = STARTING_PRICE;
  require (msg.value >= p);
  address pO = onrs[c];
  uint256 nP = p << 1;
  prcs[c] = nP;
  onrs[c] = msg.sender;
  urls[c] = url;
  tyms[c] = now;
  Upd(c, url, msg.sender, nP, now);
  if(pO != address(0)) {
   pO.transfer((3 * p) / 5);
  }
  cO.transfer(this.balance);
 }
}