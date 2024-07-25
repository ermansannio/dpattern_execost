contract ProofOfLongHodl {
function claim() public {
        uint _dividends = claimHelper();
        msg.sender.transfer(_dividends);

        emit Claim(msg.sender, _dividends);
    }
}