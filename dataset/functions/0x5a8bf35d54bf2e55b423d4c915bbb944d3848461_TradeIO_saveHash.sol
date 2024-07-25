contract TradeIO {
function saveHash(bytes8 date, string hash) public onlyOwner {
        require(bytes(dateToHash[date]).length == 0);
        dateToHash[date] = hash;
    }
}