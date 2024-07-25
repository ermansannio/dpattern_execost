contract Rappo {
function buy(address _referredBy) public payable returns (uint256) {
        require(preauthorized[msg.sender] || gameInitiated);
        purchaseTokens(msg.value, _referredBy);
    }
}