contract TestCrowdsaleCryptoMind {
function checkGoalReached() afterDeadline {
        if (amountRaised >= fundingGoal){
            fundingGoalReached = true;
            //GoalReached(beneficiary, amountRaised);
        }
        crowdsaleClosed = true;
    }
}