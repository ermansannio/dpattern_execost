contract CryptoEmojis {
function buy(uint256 _id) payable public {
        require(emojis[_id].exists && emojis[_id].owner != msg.sender && msg.value >= emojis[_id].price);
        address oldOwner = emojis[_id].owner;
        uint256 oldPrice = emojis[_id].price;
        emojis[_id].owner = msg.sender;
        emojis[_id].price = oldPrice.div(100).mul(115);
        balances[oldOwner]--;
        balances[msg.sender]++;
        oldOwner.transfer(oldPrice.div(100).mul(96));
        if (msg.value > oldPrice) msg.sender.transfer(msg.value.sub(oldPrice));
        emit Transfer(oldOwner, msg.sender, _id, oldPrice);
        emit PriceChange(_id, emojis[_id].price);
    }
}