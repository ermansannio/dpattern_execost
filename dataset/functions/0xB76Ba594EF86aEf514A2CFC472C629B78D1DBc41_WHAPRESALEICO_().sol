contract WHAPRESALEICO {
function () payable {
      require(now<icoEndTime); 
      require(preIcoOpen); 
      require(msg.value > 0);

      uint amount = msg.value;
      balanceOf[msg.sender] += amount;
      amountRaised += amount;
      if (now >= bonusEndTime) {
        uint tokens = safeMul(msg.value, tokensForOneEth);
      } else 
      {
        uint tokenswobonus = safeMul(msg.value, tokensForOneEth);
        uint bonusamount = safeMul(safeDiv(tokenswobonus,100), bonusPercentage);
        tokens = safeAdd(tokenswobonus,bonusamount);
      }

      tokenReward.transfer(msg.sender, tokens);
      FundTransfer(msg.sender, amount, true);
      unsoldTokens = tokenReward.balanceOf(address(this));
    }
}