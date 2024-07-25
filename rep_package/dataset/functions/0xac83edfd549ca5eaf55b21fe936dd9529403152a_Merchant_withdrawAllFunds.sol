contract Merchant {
function withdrawAllFunds() onlyOwner public returns (bool) {
        return withdrawFunds(msg.sender, 0);
    }
}