contract CentWallet {
function addAdmin(
        address newAdmin) onlyRootAdmin public
    {
        require(!isAdmin[newAdmin]);

        isAdmin[newAdmin] = true;
        admins.push(newAdmin);
    }
}