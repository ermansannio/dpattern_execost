contract BM_MasterClass_Reserved {
function () payable {
        assert(now < dtEnd);
        assert(now >= dtStart);
        assert(msg.value>=minSizeInvest);

        if(holders[msg.sender] == 0){
            countHolders += 1;
        }
        holders[msg.sender] += msg.value;
        amount_investments += msg.value;
        Investment(msg.sender, msg.value);
    }
}