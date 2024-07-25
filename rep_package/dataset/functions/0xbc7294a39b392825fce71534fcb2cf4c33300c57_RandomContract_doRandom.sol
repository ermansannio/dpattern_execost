contract RandomContract {
function doRandom(uint64 upper) public ifAdmin returns(uint64 randomNumber) {
    _seed = uint64(keccak256(keccak256(block.blockhash(block.number), _seed), now ));
    uint64 _randomNumber = _seed % upper;
    LogRandom(_randomNumber);
    return _randomNumber;
  }
}