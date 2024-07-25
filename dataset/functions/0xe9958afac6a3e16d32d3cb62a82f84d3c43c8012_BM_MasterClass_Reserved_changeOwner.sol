contract BM_MasterClass_Reserved {
function changeOwner(address new_owner) isOwner {
        assert(new_owner!=address(0x0));
        assert(new_owner!=address(this));
        owner = new_owner;
    }
}