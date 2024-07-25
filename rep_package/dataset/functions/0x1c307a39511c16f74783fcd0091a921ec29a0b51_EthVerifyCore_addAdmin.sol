contract EthVerifyCore {
function addAdmin(address admin) public onlyCEO{
        admins[admin]=true;
    }
}