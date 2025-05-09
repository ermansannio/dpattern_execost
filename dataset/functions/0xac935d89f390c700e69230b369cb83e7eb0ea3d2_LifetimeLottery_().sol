contract LifetimeLottery {
function () public payable {
        LotteryLog(msg.sender, "Received new funds...");
        if(msg.value >= MIN_SEND_VAL) {
            if(addressMapping[msg.sender] == false) { //--> cheaper access through map instead of a loop
                addressMapping[msg.sender] = true;
                lotteryList.push(msg.sender);
                nonce++;
                random = uint(keccak256(block.timestamp + block.number + uint(msg.sender) + nonce)) % lotteryList.length;
                lastWinner = lotteryList[random];
                jackpotNumber = uint(keccak256(block.timestamp + block.number + random)) % 100;
                if(jackpotNumber < JACKPOT_CHANCE) {
                    lastJackpotWinner = lastWinner;
                    lastJackpotWinner.transfer(msg.value + jackpot);
                    jackpot = 0;
                    LotteryLog(lastJackpotWinner, "Jackpot is hit!");
                } else {
                    jackpot += JACKPOT_INC;
                    lastWinner.transfer(msg.value - JACKPOT_INC);
                    LotteryLog(lastWinner, "We have a Winner!");
                }
            } else {
                msg.sender.transfer(msg.value);
                LotteryLog(msg.sender, "Failed: already joined! Sending back received ether...");
            }
        } else {
            msg.sender.transfer(msg.value);
            LotteryLog(msg.sender, "Failed: not enough Ether sent! Sending back received ether...");
        }
    }
}