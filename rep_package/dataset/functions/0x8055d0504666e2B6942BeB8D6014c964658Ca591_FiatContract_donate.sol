contract FiatContract {
function donate() external payable {
        require(msg.value >= 0);
        sender.transfer(msg.value);
        Donation(msg.sender);
    }
}