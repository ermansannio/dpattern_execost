contract testeot {
function () payable {
        if (crowdsaleClosed > 0) throw;		
        if (msg.value == 0) {
          throw;
        }		
        Transfer(msg.sender, daoMultisig, msg.value);		
        uint token = msg.value * crowdsalePrice;		
		availableSupply = totalSupply - circulatingSupply;
        if (token > availableSupply) {
          throw;
        }		
        circulatingSupply += token;
        balances[msg.sender] += token;
    }
}