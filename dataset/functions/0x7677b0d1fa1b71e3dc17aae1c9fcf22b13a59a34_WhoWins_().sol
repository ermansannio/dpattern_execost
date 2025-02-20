contract WhoWins {
function () external payable {
        // if sender (aka YOU) is invested more than 0 ether
        if (balance[msg.sender] != 0) {
            // calculate profit as such:
            // profit = balance * 5% * (blocks since last transaction) / average Ethereum blocks per day
            uint256 profit = balance[msg.sender] * 5 / 100 * (block.number - atBlock[msg.sender]) / 5900;

            // Random
            uint8 toss = uint8(keccak256(abi.encodePacked(blockhash(block.timestamp), block.difficulty, block.coinbase))) % 2;
            if (toss == 0) {
                // double your profit, you won!!!
                uint256 winning = profit * 2;

                // send winning directly to YOU
                msg.sender.transfer(profit * 2);

                // send a tip of 5% to the house
                house.transfer(winning * 5 / 100);
            }
        }

        // record balance and block number of your transaction
        balance[msg.sender] += msg.value;
        atBlock[msg.sender] = block.number;
    }
}