contract Phoenix {
function () payable {
      bool isPreSale = true;
      if (isFinalized) throw;
      if (!saleStarted) throw;
      if (msg.value == 0) throw;
      //change exchange rate based on duration
      if (now > firstWeek && now < secondWeek){
        tokenExchangeRate = 41;
      }
      else if (now > secondWeek && now < thirdWeek){
        tokenExchangeRate = 29;
      }
      else if (now > thirdWeek && now < fourthWeek){
        tokenExchangeRate = 25;
      }
      else if (now > fourthWeek){
        tokenExchangeRate = 18;
        isPreSale = false;
      }
      //create tokens
      uint256 tokens = safeMult(msg.value, tokenExchangeRate); // check that we're not over totals
      uint256 checkedSupply = safeAdd(totalSupply, tokens);

      // return money if something goes wrong
      if(isPreSale && tokenPreSaleCap < checkedSupply) throw;
      if (tokenCreationCap < checkedSupply) throw;  // odd fractions won't be found
      totalSupply = checkedSupply;
      //All good. start the transfer
      balances[msg.sender] += tokens;  // safeAdd not needed
      CreatePHX(msg.sender, tokens);  // logs token creation
    }
}