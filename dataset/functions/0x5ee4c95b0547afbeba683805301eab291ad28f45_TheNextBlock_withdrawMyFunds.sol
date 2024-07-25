contract TheNextBlock {
function withdrawMyFunds() public {
        uint256 balance = playersStorage[msg.sender].balance;
        if(balance != 0) {
            playersStorage[msg.sender].balance = 0;
            msg.sender.transfer(balance);
        }
    }
}