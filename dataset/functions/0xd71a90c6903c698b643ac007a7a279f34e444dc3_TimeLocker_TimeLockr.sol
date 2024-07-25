contract TimeLocker {
function TimeLockr() payable open {
        Owner = msg.sender;
        minDeposit = 0.5 ether;
        Locked = false;
        deposit();
    }
}