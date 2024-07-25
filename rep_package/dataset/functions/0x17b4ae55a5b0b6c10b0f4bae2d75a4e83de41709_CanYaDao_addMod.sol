contract CanYaDao {
function addMod(address _addr) onlyAdmins public {
        if ( Util.isObject(_mods, _addr) == false ) {
            Util.add(_mods, _addr, BADGE_ADMIN);
            emit onModAdded(_addr);
        }
    }
}