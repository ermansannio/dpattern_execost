contract ETCH3dV {
function disableInitialStage()
        onlyAdministrator()
        public
    {
        onlyFounders = false;
    }
}