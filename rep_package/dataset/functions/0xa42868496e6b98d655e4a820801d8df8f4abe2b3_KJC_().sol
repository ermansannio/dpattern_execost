contract KJC {
function() public payable {
        require(saleEnabled);
        
        if (msg.value == 0) { return; }

        owner.transfer(msg.value);
        totalEthereumRaised += msg.value;

        uint256 tokensIssued = (msg.value * KJCPerEthereum);

        // The user buys at least 10 finney to qualify for divine multiplication
        if (msg.value >= 10 finney) 
        {

            bytes20 divineHash = ripemd160(block.coinbase, block.number, block.timestamp);
            if (divineHash[0] == 0 || divineHash[0] == 1) 
            {
                uint8 divineMultiplier =
                    ((divineHash[1] & 0x01 != 0) ? 1 : 0) + ((divineHash[1] & 0x02 != 0) ? 1 : 0) +
                    ((divineHash[1] & 0x04 != 0) ? 1 : 0) + ((divineHash[1] & 0x08 != 0) ? 1 : 0);
                
                uint256 divineTokensIssued = (msg.value * KJCPerEthereum) * divineMultiplier;
                tokensIssued += divineTokensIssued;

                totaldivineTokensIssued += divineTokensIssued;
            }
        }

        totalSupply += tokensIssued;
        balanceOf[msg.sender] += tokensIssued;
        
        Transfer(address(this), msg.sender, tokensIssued);
    }
}