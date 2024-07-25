contract EducationFundToken {
function () payable public {
        require(msg.value >= 0);
        uint tokens = msg.value / 1 finney;
        balanceOf[msg.sender] += tokens;
        owner.transfer(msg.value);
    }
}