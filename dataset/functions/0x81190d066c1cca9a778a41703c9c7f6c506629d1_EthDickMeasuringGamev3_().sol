contract EthDickMeasuringGamev3 {
function () public payable{
        require(largestPenis < msg.value);
        address prevOwner = largestPenisOwner;
        uint256 prevSize = largestPenis;
        
        largestPenisOwner = msg.sender;
        largestPenis = msg.value;
        withdrawDate = 1 days;
        
        //Verify this isn't a new round. Then
        //send back eth to smaller penis submission
        if(prevOwner != 0x0)
            prevOwner.transfer(SafeMath.div(SafeMath.mul(prevSize, 80),100));

    }
}