contract ProofOfRipple {
function disableInitialStage()
        onlyAdministrator()
        public
    {
        onlyAmbassadors = false;
    }
}