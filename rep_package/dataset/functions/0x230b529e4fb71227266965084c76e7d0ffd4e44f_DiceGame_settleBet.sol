contract DiceGame {
function settleBet(bytes32 reveal, bytes32 blockHash) external {


        bytes32 commit = keccak256(abi.encodePacked(reveal));

        Bet storage bet = bets[commit];

        //save gas
        uint amount = bet.amount;
        uint placeBlockNumber = bet.placeBlockNumber;
        uint8 roll = bet.roll;
        bool lessThan = bet.lessThan;
        bool isInvited = bet.isInvited;
        address player = bet.player;

        require(amount != 0);
        require(block.number > placeBlockNumber);
        require(block.number <= placeBlockNumber + BET_EXPIRATION_BLOCKS);
        require(blockhash(placeBlockNumber) == blockHash);

        bet.amount = 0;

        bytes32 entropy = keccak256(abi.encodePacked(reveal, blockhash(placeBlockNumber)));
        uint dice = uint(entropy) % 100 + 1;

        uint diceWinAmount = getDiceWinAmount(amount, roll, lessThan, isInvited);


        maxPendingPayouts = maxPendingPayouts.sub(diceWinAmount);

        uint diceWin = 0;

        if ((lessThan && dice <= roll) || (!lessThan && dice >= roll)){ //win
            diceWin = amount.add(diceWinAmount);
            safeSendFunds(player, diceWin);
        }



        emit LogResult(commit, player, roll,lessThan,  dice, amount, diceWin, diceWin == 0 ? 1 : 2, now);





    }
}