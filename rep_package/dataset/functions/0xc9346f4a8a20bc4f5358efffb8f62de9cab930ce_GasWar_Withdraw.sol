contract GasWar {
function Withdraw() public {
       
        //_withdraw(false);
        // check game withdraws from now on, false prevent re-entrancy
        CheckGameStart(false);
    }
}