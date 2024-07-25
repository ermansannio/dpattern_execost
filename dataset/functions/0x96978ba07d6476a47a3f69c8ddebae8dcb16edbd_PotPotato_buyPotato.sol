contract PotPotato {
function buyPotato(uint256 index) public payable{
        require(block.timestamp>contestStartTime);
        if(_endContestIfNeeded()){ 

        }
        else{
            Potato storage potato=potatoes[index];
            require(msg.value >= potato.price);
            //allow calling transfer() on these addresses without risking re-entrancy attacks
            require(msg.sender != potato.owner);
            require(msg.sender != ceoAddress);
            uint256 sellingPrice=potato.price;
            uint256 purchaseExcess = SafeMath.sub(msg.value, sellingPrice);
            uint256 payment = uint256(SafeMath.div(SafeMath.mul(sellingPrice, 76), 100));
            uint256 devFee= uint256(SafeMath.div(SafeMath.mul(sellingPrice, 4), 100));
            //20 percent remaining in the contract goes to the pot
            //if the owner is the contract, this is the first purchase, and payment should go to the pot
            if(potato.owner!=address(this)){
                potato.owner.transfer(payment);
            }
            ceoAddress.transfer(devFee);
            potato.price= SafeMath.div(SafeMath.mul(sellingPrice, 150), 76);
            potato.owner=msg.sender;//transfer ownership
            hotPotatoHolder=msg.sender;//becomes holder with potential to win the pot
            lastBidTime=block.timestamp;
            TIME_TO_COOK=SafeMath.add(BASE_TIME_TO_COOK,SafeMath.mul(index,TIME_MULTIPLIER)); //pots have times to cook varying from 30-85 minutes
            msg.sender.transfer(purchaseExcess);//returns excess eth
        }
    }
}