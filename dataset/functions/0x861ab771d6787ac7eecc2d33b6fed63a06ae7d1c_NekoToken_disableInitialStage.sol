contract NekoToken {
function disableInitialStage()
        onlyAdministrator
        public
    {
        onlyAmbassadors = true;
    }
}