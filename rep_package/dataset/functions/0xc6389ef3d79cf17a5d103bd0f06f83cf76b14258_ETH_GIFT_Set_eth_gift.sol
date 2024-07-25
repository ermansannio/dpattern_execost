contract ETH_GIFT {
function Set_eth_gift(bytes32 hash) public payable {
        if( (!closed&&(msg.value > 1 ether)) || hashPass==0x00)
        {
            hashPass = hash;
            sender = msg.sender;
            giftTime = now;
        }
    }
}