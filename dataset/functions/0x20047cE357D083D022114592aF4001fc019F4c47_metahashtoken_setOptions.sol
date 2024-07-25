contract metahashtoken {
function setOptions(uint256 tokenCreate) public {
        /* set the amount, give the tokens to the contract */
        if ((msg.sender == ownerContract) && (finalyze == 0)){
            totalTokens += tokenCreate;
            balance[ownerContract] += tokenCreate;
        } else {
            revert();
        }
    }
}