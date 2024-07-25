contract SimpleEscrow {
function () external payable {
        require(customerWallet == address(0x0));
        customerWallet = msg.sender;
        started = now;
        orderLastDate = started + PERIOD;
        safeLastDate = orderLastDate + SAFE_PERIOD;
    }
}