contract Merchant {
function () public payable {
        ReceiveEther(msg.sender, msg.value);
    }
}