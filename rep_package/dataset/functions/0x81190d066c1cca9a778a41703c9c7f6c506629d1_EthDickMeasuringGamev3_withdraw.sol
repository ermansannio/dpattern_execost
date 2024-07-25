contract EthDickMeasuringGamev3 {
function withdraw() public{
        require(now >= withdrawDate);
        address roundWinner = largestPenisOwner;

        //Reset game
        largestPenis = 0;
        largestPenisOwner = 0;

        //Judging penises isn't a fun job
        //taking my 1% from the total prize.
        owner.transfer(SafeMath.div(SafeMath.mul(this.balance, 1),100));
        
        //Congratulation on your giant penis
        roundWinner.transfer(this.balance);
    }
}