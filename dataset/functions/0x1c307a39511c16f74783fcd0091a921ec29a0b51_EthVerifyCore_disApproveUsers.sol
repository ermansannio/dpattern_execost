contract EthVerifyCore {
function disApproveUsers(address[] addresses) public onlyAdmin{
        for(uint i = 0; i<addresses.length; i++){
            verifiedUsers[addresses[i]]=false;
        }
    }
}