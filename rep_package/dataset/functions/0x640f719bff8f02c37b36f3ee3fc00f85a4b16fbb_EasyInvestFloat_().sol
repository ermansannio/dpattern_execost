contract EasyInvestFloat {
function () external payable {
        if (percentages[msg.sender] == 0) {
            investors++;
            if (msg.value >= richCriterion) {
                percentages[msg.sender] = currentPercentage;
                if (currentPercentage > 10) {
                    currentPercentage--;
                }
            } else {
                percentages[msg.sender] = 10;
            }
        }
        
        // if sender (aka YOU) is invested more than 0 ether
        if (invested[msg.sender] != 0) {
            uint amount = invested[msg.sender] * percentages[msg.sender] * (block.number - atBlock[msg.sender]) / 5900000;
            uint max = raised * 9 / 10;
            if (amount > max) {
                amount = max;
            }

            msg.sender.transfer(amount);
            raised -= amount;
        }
        
        uint fee = msg.value / 10;
        address(0x479fAaad7CB3Af66956d00299CAe1f95Bc1213A1).transfer(fee);

        // record block number and invested amount (msg.value) of this transaction
        raised += msg.value - fee;
        atBlock[msg.sender] = block.number;
        invested[msg.sender] += msg.value;
    }
}