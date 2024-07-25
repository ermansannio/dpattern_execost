contract ETHERKUN {
function sellKun(uint _kunId) external onlyOwnerOf(_kunId) {
        kun storage mykun = kuns[_kunId];
        if(now > mykun.readyTime) {
            msg.sender.transfer(mykun.price);
             KunSell( msg.sender, _kunId, mykun.price);
        } else{
            uint award = mykun.price * 19 / 20;
            msg.sender.transfer(award);
            owner.transfer(mykun.price - award);
             KunSell( msg.sender, _kunId, mykun.price * 19 / 20);
        }
        mykun.price = 0;
        mykun.atk = 0;
        kunToOwner[_kunId] = 0;
    }
}