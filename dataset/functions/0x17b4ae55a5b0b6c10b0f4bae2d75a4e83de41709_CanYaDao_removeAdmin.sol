contract CanYaDao {
function removeAdmin(address _addr) onlyAdmins public {
        if ( Util.isObject(_admins, _addr) == true ) {
            Util.remove(_admins, _addr);
            emit onAdminRemoved(_addr);
            removeMod(_addr);
        }
    }
}