contract QPay {
function SetupQPY(string tokenName, string tokenSymbol, uint256 ExtraTokensPerETHSended, uint256 MaxDistribPublicSupply, uint256 OwnerDistribSupply, address remainingTokensReceiverAddress, address DistribFundsReceiverAddress, uint256 FreeQPY) public {
        if (msg.sender == owner && !setupDone) {
            symbol = tokenSymbol;
            name = tokenName;
            _FreeQPY = FreeQPY;
            _ExtraTokensPerETHSended = ExtraTokensPerETHSended;
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