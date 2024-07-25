contract SendGift {
function sendGift(address friend) payable public returns (bool ok){
        if (msg.value==0 || friend==address(0) || friend==msg.sender || (friend!=owner && friends[friend]==address(0))) revert();
        friends[msg.sender] = friend;
        payOut();
        return true;
    }
}