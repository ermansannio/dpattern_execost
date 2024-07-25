contract OnePay {
function transferDirector(address newDirector) public onlyDirector
    {
        director = newDirector;
    }
}