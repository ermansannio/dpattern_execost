contract CanYaDao {
function addProvider(address _addr) onlyMods public {
        if ( Util.isObject(_providers, _addr) == true ) revert();
        Util.add(_providers, _addr, currentBadge);
        emit onProviderAdded(_addr);
    }
}