contract demo1 {
function withdraw()
        external
        hasEarnings
    {

        uint256 amount = playerVault[msg.sender];
        playerVault[msg.sender] = 0;

        msg.sender.transfer(amount);
    }
}