contract ChickenFarmer {
function buyEggs() public payable{
        require(initialized);
        uint256 eggsBought=calculateEggBuy(msg.value,SafeMath.sub(this.balance,msg.value));
   //     claimedEggs[msg.sender]=SafeMath.add(claimedEggs[msg.sender],eggsBought);
        
        uint256 newChicken=SafeMath.div(eggsBought,EGGS_TO_HATCH_1CHICKEN);

        if (hatcheryChicken[msg.sender]==0){
        lastHatch[msg.sender]=now;
        }

        hatcheryChicken[msg.sender]=SafeMath.add(hatcheryChicken[msg.sender],newChicken);

        //boost market to nerf Chicken hoarding
        marketEggs=SafeMath.add(marketEggs,SafeMath.div(eggsBought,10));



    }
}