contract GFDGSHBoard {
function adminWithdraw() public onlyOwner {
        msg.sender.transfer(ownerBalance);
    }
}