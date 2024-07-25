contract OnePay {
function openSale() public onlyDirector returns (bool success)
    {
        saleClosed = false;
        return true;
    }
}