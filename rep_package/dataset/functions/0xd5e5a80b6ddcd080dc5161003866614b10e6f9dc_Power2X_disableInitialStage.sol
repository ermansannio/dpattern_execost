contract Power2X {
function disableInitialStage()
        onlyAdministrator()
        public
    {
        onlyAmbassadors = false;
    }
}