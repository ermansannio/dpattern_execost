contract Phoenix {
function startSale() external {
      if(saleStarted) throw;
      if (msg.sender != ethFundDeposit) throw; // locks start sale to the ultimate ETH owner
      firstWeek = now + 1 weeks; //sets duration of first cutoff
      secondWeek = firstWeek + 1 weeks; //sets duration of second cutoff
      thirdWeek = secondWeek + 1 weeks; //sets duration of third cutoff
      fourthWeek = thirdWeek + 1 weeks; //sets duration of fourth cutoff
      saleStarted = true; //start the sale
    }
}