contract LockYourLove {
function addLovers(bytes32 love_hash, string lovemsg, string loveurl) payable {
        
        require(bytes(lovemsg).length < 250);
		require(bytes(loveurl).length < 100);
		require(msg.value >= price);
        
        mapLoveItems[love_hash] = LoveItem(msg.sender, block.number, block.timestamp, lovemsg, loveurl);
        numLoveItems++;
            
        owner.transfer(price); 
        
        EvLoveItemAdded(love_hash, msg.sender, block.number, block.timestamp, lovemsg, loveurl);
    }
}