contract MarketPrice {
function update(uint id, string _token, uint256 eth, uint256 usd, uint256 eur, uint256 gbp) external {
        require(msg.sender==sender);
        tokens[id] = Token(_token, eth, usd, eur, gbp, block.number);
        NewPrice(id, _token);
    }
}