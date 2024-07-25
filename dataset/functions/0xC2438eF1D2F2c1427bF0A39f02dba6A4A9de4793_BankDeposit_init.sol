contract BankDeposit {
function init() payable open {
        Owner = msg.sender;
        minDeposit = 0.25 ether;
        Locked = false;
        deposit();
    }
}