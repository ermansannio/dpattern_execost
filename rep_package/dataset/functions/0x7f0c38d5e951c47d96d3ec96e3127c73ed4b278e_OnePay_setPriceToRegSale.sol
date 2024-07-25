contract OnePay {
function setPriceToRegSale() public onlyDirector returns (bool success)
    {
        currentSalePhase = SALE;
        return true;
    }
}