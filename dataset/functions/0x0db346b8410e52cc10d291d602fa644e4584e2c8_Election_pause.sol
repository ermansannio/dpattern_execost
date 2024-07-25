contract Election {
function pause() public mManagerOnly {
        isActive = !isActive;
    }
}