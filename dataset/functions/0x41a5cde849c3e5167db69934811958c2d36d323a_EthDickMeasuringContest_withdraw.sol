contract EthDickMeasuringContest {
function withdraw() public{
        require(now >= withdrawDate);
        require(msg.sender == largestPenisOwner);

        //Reset game
        largestPenisOwner = 0;
        largestPenis = 0;

        //Judging penises isn't a fun job
        //taking my 3% from the total prize.
        owner.transfer(this.balance*3/100);
        
        //Congratulation on your giant penis.
        //Swing that big dig around
        msg.sender.transfer(this.balance);
    }
}