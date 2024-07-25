contract BachelorBucks {
function createWildcard(string wildcardName, uint256 cost, uint16 number) public onlyByOwner() returns (bool success) {
        if (wildcardCount > 65534) revert();
        if (number == 0) revert();
        if (cost == 0) revert();
        var wildcard = wildcards[wildcardCount];
        wildcard.name = wildcardName;
        wildcard.index = wildcardCount;
        wildcard.available = number;
        wildcard.cost = cost;
        wildcardCount += 1;
        return true;
    }
}