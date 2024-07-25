contract ProofOfBitconnect {
function disableInitialStage()
        onlyAdministrator()
        public
    {
        onlyAmbassadors = false;
    }
}