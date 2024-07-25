contract DABcoin {
function() payable {
        if (!ICO) { revert(); }
        if(totalSupply+(msg.value / 1e14) > 1000000) { revert(); }
        if (msg.value == 0) { return; }

        creator.transfer(msg.value);

        uint256 tokensIssued = (msg.value / 1e14);

        totalSupply += tokensIssued;
        balances[msg.sender] += tokensIssued;

        Transfer(address(this), msg.sender, tokensIssued);
    }
}