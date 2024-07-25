contract Dividends {
function Withdraw() public{
        _withdraw(msg.sender, balanceOf[msg.sender], true);
    }
}