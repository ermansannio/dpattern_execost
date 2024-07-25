contract CanYaDao {
function setCurrentBadge(bytes32 _badge) onlyAdmins public {
        currentBadge = _badge;
    }
}