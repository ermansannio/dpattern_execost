contract OneSingleCoin {
function buy(string message) public payable returns (bool) {
        require (msg.value >= price);
        
        if (msg.value > price) {
            balance[msg.sender] += msg.value - price;
        }
        uint256 previousHodlersCount = previousHodlers.length;
        for (uint256 i = 0; i < previousHodlersCount; i++) {
            balance[previousHodlers[i]] += (price * 8 / 100) / previousHodlersCount;
        }
        balance[currentHodler] += price * 92 / 100;

        price = price * 120 / 100;  
        previousHodlers.push(currentHodler);
        messages.push(message);
        
        currentHodler = msg.sender;
        currentHodlerId = previousHodlersCount + 1;
        emit Purchased(currentHodlerId, currentHodler);
    }
}