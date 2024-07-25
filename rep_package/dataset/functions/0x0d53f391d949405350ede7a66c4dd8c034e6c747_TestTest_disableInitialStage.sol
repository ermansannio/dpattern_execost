contract TestTest {
function disableInitialStage()
        onlyAdmin()
        public
    {
        onlyAdminsFriends = false;
    }
}