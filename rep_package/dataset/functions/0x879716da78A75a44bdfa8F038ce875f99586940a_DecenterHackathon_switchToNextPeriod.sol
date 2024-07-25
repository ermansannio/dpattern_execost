contract DecenterHackathon {
function switchToNextPeriod() onlyOwner {
        if(currentPeriod == Period.Verification || currentPeriod == Period.End) {
            return;
        }

        currentPeriod = Period(uint(currentPeriod) + 1);

        PeriodChanged(currentPeriod);
    }
}