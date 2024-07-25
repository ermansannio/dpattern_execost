contract EGCSnakesAndLadders {
function userWithdraw() public {
        uint amount = users[msg.sender].points.mul(calcExchangeRate());
        require(amount > 0);

        total_points = total_points.sub(users[msg.sender].points);
        users[msg.sender].position = 0;
        users[msg.sender].points = 0;
        users[msg.sender].rolls = 0;

        msg.sender.transfer(amount);
    }
}