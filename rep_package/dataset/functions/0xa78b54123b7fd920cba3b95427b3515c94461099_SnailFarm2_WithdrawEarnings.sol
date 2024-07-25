contract SnailFarm2 {
function WithdrawEarnings() public {
        require(playerEarnings[msg.sender] > 0);
        
        uint _amount = playerEarnings[msg.sender];
        playerEarnings[msg.sender] = 0;
        msg.sender.transfer(_amount);
        
        emit WithdrewEarnings(msg.sender, _amount);
    }
}