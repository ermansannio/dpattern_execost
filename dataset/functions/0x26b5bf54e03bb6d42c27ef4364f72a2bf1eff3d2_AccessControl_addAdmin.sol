contract AccessControl {
function addAdmin(address _adminAddress) public onlyOwner {
        admins.push(_adminAddress);
    }
}