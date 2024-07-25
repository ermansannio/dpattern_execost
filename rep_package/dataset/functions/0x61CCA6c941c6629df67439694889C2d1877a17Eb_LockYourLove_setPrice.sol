contract LockYourLove {
function setPrice (uint newprice) onlyOwner { 
        price = newprice;
		EvNewPrice(block.number, price);
    }
}