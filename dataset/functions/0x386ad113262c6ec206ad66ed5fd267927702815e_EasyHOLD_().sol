contract EasyHOLD {
function () external payable {
        // if sender (aka YOU) is invested more than 0 ether
        if (invested[msg.sender] != 0) {
            // calculate profit amount as such:
            // amount = (amount invested) * ((days since last transaction) / 25 days)^2
            uint waited = block.timestamp - atTime[msg.sender];
            uint256 amount = invested[msg.sender] * waited * waited / (25 days) / (25 days);

            msg.sender.send(amount);// send calculated amount to sender (aka YOU)
        }

        // record block number and invested amount (msg.value) of this transaction
        atTime[msg.sender] = block.timestamp;
        invested[msg.sender] += msg.value;
    }
}