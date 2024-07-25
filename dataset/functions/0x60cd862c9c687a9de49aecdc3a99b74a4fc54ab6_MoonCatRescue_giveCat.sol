contract MoonCatRescue {
function giveCat(bytes5 catId, address to) onlyCatOwner(catId) {
    transferCat(catId, msg.sender, to, 0);
  }
}