contract CanYaDao {
function rejectProvider(address _addr) onlyMods public {
        if ( Util.isRejected(_providers, _addr) == true ) revert(); 
        Util.reject(_providers, _addr);
        emit onProviderRejected(_addr);
    }
}