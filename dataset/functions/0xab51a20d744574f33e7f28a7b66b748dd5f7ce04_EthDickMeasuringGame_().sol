contract EthDickMeasuringGame {
function () public payable{
        require(largestPenis < msg.value);
        largestPenis = msg.value;
        withdrawDate = now + 2 days;
        largestPenisOwner = msg.sender;
    }
}