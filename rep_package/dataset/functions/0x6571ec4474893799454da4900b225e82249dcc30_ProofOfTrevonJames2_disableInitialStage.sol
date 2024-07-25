contract ProofOfTrevonJames2 {
function disableInitialStage()
        onlyAdministrator()
        public
    {
        onlyAmbassadors = false;
    }
}