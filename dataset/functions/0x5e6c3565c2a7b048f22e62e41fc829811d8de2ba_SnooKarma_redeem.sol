contract SnooKarma {
function redeem(string username, uint karma, uint sigExp, uint8 sigV, bytes32 sigR, bytes32 sigS) public {
        //The identity of the oracle is checked
        require(
            ecrecover(
                keccak256(abi.encodePacked(this, username, karma, sigExp)),
                sigV, sigR, sigS
            ) == oracle
        );
        //The signature must not be expired
        require(block.timestamp < sigExp);
        //The amount of karma needs to be more than the previous redeemed amount
        require(karma > redeemedKarma[username]);
        //The new karma that is available to be redeemed
        uint newUserKarma = karma - redeemedKarma[username];
        //The user's karma balance is updated with the new karma
        balanceOf[msg.sender] = safeAdd(balanceOf[msg.sender], newUserKarma);
        //The maintainer's extra karma is computed (1 extra karma for each 100 redeemed by a user)
        uint newMaintainerKarma = newUserKarma / 100;
        //The balance of the maintainer is updated
        balanceOf[maintainer] = safeAdd(balanceOf[maintainer], newMaintainerKarma);
        //The total supply (ERC20) is updated
        totalSupply = safeAdd(totalSupply, safeAdd(newUserKarma, newMaintainerKarma));
        //The amount of karma redeemed by a user is updated
        redeemedKarma[username] = karma;
        //The Redeem event is triggered
        emit Redeem(username, msg.sender, newUserKarma);
    }
}