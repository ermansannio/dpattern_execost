contract KICKPriceOracle {
function updatePrice(uint256 _newPrice) public {
        require(_newPrice > 0);
        require(admins[msg.sender] == true);
        ETHPrice = _newPrice;
        emit PriceChanged(_newPrice);
    }
}