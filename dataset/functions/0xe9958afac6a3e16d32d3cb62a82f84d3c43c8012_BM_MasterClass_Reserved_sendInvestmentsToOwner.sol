contract BM_MasterClass_Reserved {
function sendInvestmentsToOwner() isOwner {
        assert(now >= dtEnd);
        owner.transfer(this.balance);
    }
}