contract RevertReason {
function shouldRevert(bool yes) public {
        require(!yes, "Shit it reverted!");
    }
}