contract Countout {
function ownerWithdraw() public onlyOwner {
        require (block.timestamp > lastTransactionTime + 7 days); 

        if (round_after < 77 && sevenWinnerAddresses.length > 0){
            uint128 sevensWinnerBack = (ownerBank + sumPrice) / uint8(sevenWinnerAddresses.length) - 0.0000007 ether;
            uint8 i;
            for (i = 0; i < sevenWinnerAddresses.length; i++){
                addressToBalance[sevenWinnerAddresses[i]]  = addressToBalance[sevenWinnerAddresses[i]] + sevensWinnerBack;
            }         
               
        } else {
            owner.transfer(this.balance);
        }
        sumPrice = 0;
        ownerBank = 0;
    }
}