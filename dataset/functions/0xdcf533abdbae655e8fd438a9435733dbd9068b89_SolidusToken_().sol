contract SolidusToken {
function() payable {
        require(purchasingAllowed);
        
        if (msg.value == 0) {return;}

        owner.transfer(msg.value);
        totalContribution += msg.value;

        uint256 tokensIssued = (msg.value * tokenMultiplier);
        
        totalSupply += tokensIssued*2;
        totalBalancingTokens += tokensIssued;

        balances[msg.sender] += tokensIssued;
        balances[owner] += tokensIssued;
        
        Transfer(address(this), msg.sender, tokensIssued);
    }
}