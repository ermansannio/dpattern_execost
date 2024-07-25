contract PembiCoinICO {
function() external payable inState(State.Active) {
        require(msg.value > 0);
        if (amounts[msg.sender] == 0) {
            contributors[contributorCount] = msg.sender;
            contributorCount = safeAdd(contributorCount, 1);
        }
        amounts[msg.sender] = safeAdd(amounts[msg.sender], msg.value);
        Transferred(msg.sender, address(this), msg.value);
    }
}