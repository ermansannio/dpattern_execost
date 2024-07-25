contract QI {
function setOwners(address[] _admin) public onlyOwner {
        uint len = _admin.length;
        for(uint i= 0; i< len; i++) {
            require(!isContract(_admin[i]),"not support contract address as owner");
            require(!isOwner[_admin[i]],"the address is admin already");
            isOwner[_admin[i]] = true;
        }
    }
}