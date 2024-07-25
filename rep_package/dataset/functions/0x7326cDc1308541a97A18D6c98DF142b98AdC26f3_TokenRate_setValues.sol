contract TokenRate {
function setValues(uint USD, uint EUR, uint GBP, uint BTC) ownerOnly public {
        USDValue = USD;
        EURValue = EUR;
        GBPValue = GBP;
        BTCValue = BTC;
    }
}