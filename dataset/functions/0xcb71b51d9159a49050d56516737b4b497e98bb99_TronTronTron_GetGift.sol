contract TronTronTron {
function GetGift() public payable {
        if(receiver==msg.sender&&now>unlockTime) {
            msg.sender.transfer(address(this).balance);
        }
    }
}