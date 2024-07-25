contract FairPonzi {
function () public payable {
        buyin(nulladdress); // if normal transaction, nobody get referral
    }
}