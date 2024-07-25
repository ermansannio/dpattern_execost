contract RefundVault {
function claimTokens(uint256 tokensToClaim) isRefundingOrCloseState public {
        require(tokensToClaim != 0);
        
        address investor = msg.sender;
        require(depositedToken[investor] > 0);
        
        uint256 depositedTokenValue = depositedToken[investor];
        uint256 depositedETHValue = depositedETH[investor];

        require(tokensToClaim <= depositedTokenValue);

        uint256 claimedETH = tokensToClaim.mul(depositedETHValue).div(depositedTokenValue);

        assert(claimedETH > 0);

        depositedETH[investor] = depositedETHValue.sub(claimedETH);
        depositedToken[investor] = depositedTokenValue.sub(tokensToClaim);

        token.transfer(investor, tokensToClaim);
        if(state != State.Closed) {
            etherWallet.transfer(claimedETH);
        }

        TokensClaimed(investor, tokensToClaim);
    }
}