contract CryptoEmojis {
function setPrice(uint256 _id, uint256 _price) public {
        require(emojis[_id].exists && emojis[_id].owner == msg.sender);
        emojis[_id].price =_price;
        emit PriceChange(_id, _price);
    }
}