contract SMINT {
function () external payable {
        if (msg.value > 0) {
            revert();
        }
        
        uint minedAtBlock = uint(block.blockhash(block.number - 1));
        uint minedHashRel = uint(sha256(minedAtBlock + uint(msg.sender) + block.timestamp)) % 1000000;
        uint balanceRel = (balanceOf[msg.sender] + frozenBalanceOf[msg.sender]) * 1000000 / totalSupply;
        if (balanceRel > 0) {
            uint k = balanceRel;
            if (k > 255) {
                k = 255;
            }
            k = 2 ** k;
            balanceRel = 500000 / k;
            balanceRel = 500000 - balanceRel;
            if (minedHashRel < balanceRel) {
                uint reward = 100000000000000000 + minedHashRel * 1000000000000000;
                uint rewardAddition = reward * (block.number - lastEfficientBlockNumber) * 197 / 1000000;
                reward += rewardAddition;
                balanceOf[msg.sender] += reward;
                totalSupply += reward;
                _unfreezeMaxTokens(reward);
                Transfer(0, this, reward);
                Transfer(this, msg.sender, reward);
                Mine(msg.sender, reward, rewardAddition);
                successesOf[msg.sender]++;
                lastEfficientBlockNumber = block.number;
            } else {
                Mine(msg.sender, 0, 0);
                failsOf[msg.sender]++;
            }
        } else {
            revert();
        }
    }
}