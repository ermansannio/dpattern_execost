contract Redeem {
function withdrawAll() onlyAdmin public { msg.sender.transfer(this.balance); }
}