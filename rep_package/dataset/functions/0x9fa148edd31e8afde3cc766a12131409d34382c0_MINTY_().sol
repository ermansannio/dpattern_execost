contract MINTY {
function () external payable {
        if (msg.value == fee) {
            randomNumber += block.timestamp + uint(msg.sender);
            uint minedAtBlock = uint(block.blockhash(block.number - 1));
            uint minedHashRel = uint(sha256(minedAtBlock + randomNumber + uint(msg.sender))) % 10000000;
            uint balanceRel = balanceOf[msg.sender] * 1000 / minted;
            if (balanceRel >= 1) {
                if (balanceRel > 255) {
                    balanceRel = 255;
                }
                balanceRel = 2 ** balanceRel;
                balanceRel = 5000000 / balanceRel;
                balanceRel = 5000000 - balanceRel;
                if (minedHashRel < balanceRel) {
                    uint reward = minReward + minedHashRel * 1000 / reducer * 100000000000000;
                    _transfer(this, msg.sender, reward);
                    minted += reward;
                    successesOf[msg.sender]++;
                } else {
                    Transfer(this, msg.sender, 0);
                    failsOf[msg.sender]++;
                }
                ownerBalance += fee;
                reducer++;
            } else {
                revert();
            }
        } else {
            revert();
        }
    }
}