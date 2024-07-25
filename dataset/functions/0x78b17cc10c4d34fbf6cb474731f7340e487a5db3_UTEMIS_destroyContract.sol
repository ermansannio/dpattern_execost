contract UTEMIS {
function destroyContract() onlyOwner external{
        selfdestruct(owner);
    }
}