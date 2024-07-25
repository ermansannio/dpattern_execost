contract WHAPRESALEICO {
function checkGoalReached() aftericoEndTime {
      if (amountRaised >= fundingGoal){
        fundingGoalReached = true;
        GoalReached(beneficiary, amountRaised);
      }
      preIcoOpen = false;
    }
}