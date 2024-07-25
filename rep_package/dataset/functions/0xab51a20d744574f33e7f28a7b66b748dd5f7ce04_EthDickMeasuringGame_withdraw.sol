contract EthDickMeasuringGame {
function withdraw() public{
        require(now >= withdrawDate);

        //Reset game
        largestPenis = 0;

        //Judging penises isn't a fun job
        //taking my 3% from the total prize.
        owner.transfer(this.balance*3/100);
        
        //Congratulation on your giant penis
        largestPenisOwner.transfer(this.balance);
        largestPenisOwner = 0;
    }
}