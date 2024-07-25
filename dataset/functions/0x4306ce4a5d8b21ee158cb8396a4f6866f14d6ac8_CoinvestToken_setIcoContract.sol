contract CoinvestToken {
function setIcoContract(address _icoContract)
      external
      only_maintainer
    {
        require(icoContract == 0);
        icoContract = _icoContract;
    }
}