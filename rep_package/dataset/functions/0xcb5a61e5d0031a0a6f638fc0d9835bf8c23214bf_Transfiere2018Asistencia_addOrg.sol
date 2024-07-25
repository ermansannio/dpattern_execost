contract Transfiere2018Asistencia {
function addOrg(string _codigo) public {
        require(msg.sender == owner);
        
        for (uint i = 0; i < availableOrgs.length; i++) {
            if (keccak256(availableOrgs[i].codigo) == keccak256(_codigo)) {
                return;
            }
        }
        
        availableOrgs.push(Organization(_codigo));
    }
}