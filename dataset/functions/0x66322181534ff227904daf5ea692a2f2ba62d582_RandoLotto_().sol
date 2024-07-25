contract RandoLotto {
function () public payable {
        require(msg.sender == tx.origin);
        require(msg.value >= 0.001 ether);
    
        uint256 randomNumber = uint256(keccak256(blockhash(block.number - 1)));
        
        if (randomNumber > highScore) {
            currentWinner = msg.sender;
            lastTimestamp = now;
        }
    }
}