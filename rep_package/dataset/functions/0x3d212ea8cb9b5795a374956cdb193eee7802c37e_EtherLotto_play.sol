contract EtherLotto {
function play() payable {

        // Participants must spend some fixed ether before playing lottery.
        assert(msg.value == TICKET_AMOUNT);

        // Increase pot for each participant.
        pot += msg.value;

        // Compute some *almost random* value for selecting winner from current transaction.
        var random = uint(block.blockhash(block.number)) + block.timestamp + block.difficulty + block.number;

        // Distribution: 50% of participants will be winners.
        if (mulmod(random, 1, 2) == 0) {

            // Send fee to bank account.
            bank.transfer(FEE_AMOUNT);

            // Send jackpot to winner.
            msg.sender.transfer(pot - FEE_AMOUNT);

            // Restart jackpot.
            pot = 0;
        }
    }
}