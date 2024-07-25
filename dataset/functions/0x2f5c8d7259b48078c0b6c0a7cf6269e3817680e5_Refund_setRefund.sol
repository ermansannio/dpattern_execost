contract Refund {
function setRefund(address _buyer) public onlyOwner payable {
        refunds[_buyer] = refunds[_buyer].add(msg.value);
    }
}