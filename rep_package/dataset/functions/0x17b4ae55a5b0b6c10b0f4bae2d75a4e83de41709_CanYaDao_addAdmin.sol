contract CanYaDao {
function addAdmin(address _addr) onlyAdmins public {
        if ( Util.isObject(_admins, _addr) == false ) {
            Util.add(_admins, _addr, BADGE_ADMIN);
            emit onAdminAdded(_addr);
            addMod(_addr);
        }
    }
}