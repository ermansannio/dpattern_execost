contract InfinityHourglass {
function disableInitialStage()
        onlyAdmin()
        public
    {
        onlyAdminsFriends = false;
    }
}