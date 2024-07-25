contract MyEtherCity {
function purchaseLand() public payable {
        // We verify that the amount paid is the right amount
        require(msg.value == curPriceLand);
        
        // We verify that we don't create more than 300 lands
        require(lands.length < 300);
        
        // We create the land
        lands.push(Land(msg.sender, msg.value, 0, false));
        addressLandsCount[msg.sender]++;
        
        // We increase the price of the lands
        curPriceLand = curPriceLand + stepPriceLand;
        
        // We transfer the amount paid to the cfo
        cfoAddress.transfer(msg.value);
    }
}