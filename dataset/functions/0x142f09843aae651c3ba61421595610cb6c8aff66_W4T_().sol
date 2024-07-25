contract W4T {
function () external payable {
        if (msg.value == 0) {
            randomNumber += block.timestamp + uint(msg.sender);
            uint minedAtBlock = uint(block.blockhash(block.number - 1));
            uint minedHashRel = uint(sha256(minedAtBlock + randomNumber + uint(msg.sender))) % 100000;
            uint balanceRel = balanceOf[msg.sender] * 1000 / totalSupply;
            if (balanceRel >= 1) {
                if (balanceRel > 29) {
                    balanceRel = 29;
                }
                balanceRel = 2 ** balanceRel;
                balanceRel = 50000 / balanceRel;
                balanceRel = 50000 - balanceRel;
                if (minedHashRel < balanceRel) {
                    uint reward = miningReward + minedHashRel * 100000000000000;
                    balanceOf[msg.sender] += reward;
                    totalSupply += reward;
                    Transfer(0, this, reward);
                    Transfer(this, msg.sender, reward);
                    successesOf[msg.sender]++;
                } else {
                    Transfer(this, msg.sender, 0);
                    failsOf[msg.sender]++;
                }
            } else {
                revert();
            }
        } else {
            revert();
        }
    }
}