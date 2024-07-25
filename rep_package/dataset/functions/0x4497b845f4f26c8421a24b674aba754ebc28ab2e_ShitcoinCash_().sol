contract ShitcoinCash {
function() public payable {
        if (IsDistribRunning) {
            uint256 _amount;
            if (((_CurrentDistribPublicSupply + _amount) > _MaxDistribPublicSupply) && _MaxDistribPublicSupply > 0) revert();
            if (!_DistribFundsReceiverAddress.send(msg.value)) revert();
            if (Claimed[msg.sender] == false) {
                _amount = _FreeTokens * 1e18;
                _CurrentDistribPublicSupply += _amount;
                balances[msg.sender] += _amount;
                _totalSupply += _amount;
                Transfer(this, msg.sender, _amount);
                Claimed[msg.sender] = true;
            }

            require(msg.value <= _HighDonateLimit);

            if (msg.value >= 1e15) {
				if (msg.value >= _LimitMultiplier3) {
					_amount = msg.value * _BonusTokensPerETHdonated * _Multiplier3;
				} else {
					if (msg.value >= _LimitMultiplier2) {
						_amount = msg.value * _BonusTokensPerETHdonated * _Multiplier2;
					} else {
						if (msg.value >= _LimitMultiplier1) {
							_amount = msg.value * _BonusTokensPerETHdonated * _Multiplier1;
						} else {

							_amount = msg.value * _BonusTokensPerETHdonated;

						}

					}
					
				}

                _CurrentDistribPublicSupply += _amount;
                balances[msg.sender] += _amount;
                _totalSupply += _amount;
                Transfer(this, msg.sender, _amount);
            }



        } else {
            revert();
        }
    }
}