contract MarketPrice {
function donate() external payable {
        require(msg.value >= 0);
        sender.transfer(msg.value);
    }
}