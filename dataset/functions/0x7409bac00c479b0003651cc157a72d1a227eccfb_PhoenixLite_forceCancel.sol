contract PhoenixLite {
function forceCancel() public {
        isForceCanceled = true;
        msg.sender.transfer(this.balance);
    }
}