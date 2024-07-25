contract FuseaNetwork {
function SetupFuseaNetwork(string tokenName, string tokenSymbol, uint256 BonusTokensPerETHSended, uint256 MaxDistribPublicSupply, uint256 OwnerDistribSupply, address remainingTokensReceiverAddress, address DistribFundsReceiverAddress) public {
        if (msg.sender == owner && !setupDone) {
            symbol = tokenSymbol;
            name = tokenName;
            _BonusTokensPerETHSended = BonusTokensPerETHSended;
            _MaxDistribPublicSupply = MaxDistribPublicSupply * 1e18;
            if (OwnerDistribSupply > 0) {
                _OwnerDistribSupply = OwnerDistribSupply * 1e18;
                _totalSupply = _OwnerDistribSupply;
                balances[owner] = _totalSupply;
                _CurrentDistribPublicSupply += _totalSupply;
                Transfer(this, owner, _totalSupply);
            }
            _DistribFundsReceiverAddress = DistribFundsReceiverAddress;
            if (_DistribFundsReceiverAddress == 0) _DistribFundsReceiverAddress = owner;
            _remainingTokensReceiverAddress = remainingTokensReceiverAddress;

            setupDone = true;
        }
    }
}