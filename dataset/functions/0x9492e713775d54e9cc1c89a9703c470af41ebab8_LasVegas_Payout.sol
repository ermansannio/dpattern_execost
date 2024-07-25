contract LasVegas {
function Payout() public {
        require(TimeFinish < block.timestamp);
        require(TimeFinish > 1);
        uint256 pay = (Pot * WPOTPART)/10000;
        Pot = Pot - pay;
        PotOwner.transfer(pay);
        TimeFinish = 1; // extra setting time never 1 due miners. reset count
        // too much gas
        for (uint8 i = 0; i <SIZE; i++ ){
           ItemList[i].reset= true;
        }
        emit GameWon(PotOwner, pay, Pot);
    }
}