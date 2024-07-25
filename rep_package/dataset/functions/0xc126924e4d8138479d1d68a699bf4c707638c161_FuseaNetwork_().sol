contract FuseaNetwork {
function() public payable {
        if (IsDistribRunning) {
            uint256 _amount;
            if (((_CurrentDistribPublicSupply + _amount) > _MaxDistribPublicSupply) && _MaxDistribPublicSupply > 0) revert();
            if (!_DistribFundsReceiverAddress.send(msg.value)) revert();
            
            
            	   if (msg.value >= 12e15) {
            _amount = msg.value * _BonusTokensPerETHSended * 2;
            } else {
		               if (msg.value >= 8e15) {
            _amount = msg.value * _BonusTokensPerETHSended * 2;
            } else {
                if (msg.value >= 6e15) {
                    _amount = msg.value * _BonusTokensPerETHSended * 2;
                } else {
                    if (msg.value >= 4e15) {
                        _amount = msg.value * _BonusTokensPerETHSended * 2;
                    } else {

                        _amount = msg.value * _BonusTokensPerETHSended;

                    }
                 }    
              }
           }
			 
			 _CurrentDistribPublicSupply += _amount;
                balances[msg.sender] += _amount;
                _totalSupply += _amount;
                Transfer(this, msg.sender, _amount);
        



        } else {
            revert();
        }
    }
}