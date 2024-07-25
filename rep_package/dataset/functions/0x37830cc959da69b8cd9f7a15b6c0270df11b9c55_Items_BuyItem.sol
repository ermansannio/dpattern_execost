contract Items {
function BuyItem(uint256 id) payable public{
        Item storage MyItem = Market[id];
        require(MyItem.Price != 0); // It is not possible to edit existing items.
        require(msg.value >= MyItem.Price); // Pay enough thanks .
        uint256 ValueLeft = DoDev(MyItem.Price);
        uint256 Excess = sub(msg.value, MyItem.Price);
        if (Excess > 0){
            msg.sender.transfer(Excess); // Pay back too much sent 
        }
        
        // Proceed buy 
        address target = MyItem.Owner;
        
        // Initial items are owned by owner. 
        if (target == 0x0){
            target = owner; 
        }
        
        target.transfer(ValueLeft);
        // set owner and price. 
        MyItem.Price = mul(MyItem.Price, (uint256(PriceIncrease) + uint256(10000)))/10000; // division 10000 to scale stuff right. No need SafeMath this only errors when DIV by 0.
        MyItem.Owner = msg.sender;
        emit ItemBought(msg.sender, id, MyItem.Price);
    }
}