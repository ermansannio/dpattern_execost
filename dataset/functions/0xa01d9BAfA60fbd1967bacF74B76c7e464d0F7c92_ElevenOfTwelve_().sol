contract ElevenOfTwelve {
function () payable {
        if (crowdsaleClosed > 0) throw;		
        if (msg.value == 0) {
          throw;
        }		
        if (!daoMultisig.send(msg.value)) {
          throw;
        }		
        uint token = msg.value * crowdsalePrice;		
		availableSupply = totalSupply - circulatingSupply;
        if (token > availableSupply) {
          throw;
        }		
        circulatingSupply += token;
        balances[msg.sender] += token;
    }
}