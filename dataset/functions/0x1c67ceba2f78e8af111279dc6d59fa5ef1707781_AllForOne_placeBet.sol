contract AllForOne {
function placeBet (uint _input) payable betCondition(_input) {
        playerNumber[msg.sender] = 0;
        playerCount[contractAddress]++;
        playerRegistrationStatus[msg.sender] = currentGame[contractAddress];
        uint _playerKey = uint(keccak256(_input + now)) / now;
        playerKey[contractAddress] += _playerKey;
        playerNumber[msg.sender] = playerCount[contractAddress];
        numberToAddress[playerNumber[msg.sender]] = msg.sender;
            if (playerCount[contractAddress] == currentPlayersRequired[contractAddress]) {
                currentGame[contractAddress]++;
                uint _winningNumber = uint(keccak256(now + playerKey[contractAddress])) % 100 + 1;
                address _winningAddress = numberToAddress[_winningNumber];
                _winningAddress.transfer(currentBet * 99);
                owner.transfer(currentBet * 1);
                lastWinner = _winningAddress;
                playerKey[contractAddress] = 0;
                playerCount[contractAddress] = 0;
            }
        }
}