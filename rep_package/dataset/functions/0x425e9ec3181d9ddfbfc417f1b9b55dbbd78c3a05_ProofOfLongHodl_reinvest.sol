contract ProofOfLongHodl {
function reinvest() public {
        uint _dividends = claimHelper();
        depositHelper(_dividends);

        emit Reinvest(msg.sender, _dividends);
    }
}