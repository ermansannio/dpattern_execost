contract PlayCoinPow {
function disableInitialStage()
        onlyAdministrator()
        public
    {
        onlyAmbassadors = false;
    }
}