contract OnePay {
function withdrawFunds() public
    {
        director.transfer(this.balance);
    }
}