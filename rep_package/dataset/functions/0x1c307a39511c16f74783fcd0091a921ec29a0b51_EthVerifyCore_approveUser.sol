contract EthVerifyCore {
function approveUser(address user) public onlyAdmin{
        verifiedUsers[user]=true;
    }
}