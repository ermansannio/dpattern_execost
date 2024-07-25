contract VaraToken {
function () payable public {
        require(msg.value > 0 ether);
        require(now > 1514678400);              // 12/12/2017
        require(now < 1519776000);              // 28/2/2018
        uint256 amount = msg.value * 750;
        require(balanceOf[owner] >= amount);
        require(balanceOf[msg.sender] < balanceOf[msg.sender] + amount);
        balanceOf[owner] -= amount;
        balanceOf[msg.sender] += amount;
        owner.transfer(msg.value);
    }
}