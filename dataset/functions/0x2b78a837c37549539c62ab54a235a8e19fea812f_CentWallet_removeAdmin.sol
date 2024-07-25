contract CentWallet {
function removeAdmin(
        address oldAdmin) onlyRootAdmin public
    {
        require(isAdmin[oldAdmin] && admins[0] != oldAdmin);

        bool found = false;
        for (uint i = 1; i < admins.length - 1; i++) {
            if (!found && admins[i] == oldAdmin) {
                found = true;
            }
            if (found) {
                admins[i] = admins[i + 1];
            }
        }

        admins.length--;
        isAdmin[oldAdmin] = false;
    }
}