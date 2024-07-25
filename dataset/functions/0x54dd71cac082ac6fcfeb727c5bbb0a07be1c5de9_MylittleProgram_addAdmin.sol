contract MylittleProgram {
function addAdmin (address _admin) public {
admins[_admin] = true;
}
}