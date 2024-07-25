contract BMToken {
function setICOContract(address new_address) isOwner
    {
        assert(ico_contract==address(0x0));
        assert(new_address!=address(0x0));
        assert(new_address!=address(this));
        ico_contract = new_address;
    }
}