contract OysterShell {
function amendLock(uint256 lockMinSet, uint256 lockMaxSet) public onlyDirector returns (bool success) {
        // Set lockMin
        lockMin = lockMinSet;
        
        // Set lockMax
        lockMax = lockMaxSet;
        return true;
    }
}