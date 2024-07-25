contract TakeoutController {
function extractFund(uint256 _amount) external onlyOwner {
        if (_amount == 0) {
            takeoutWallet.transfer(address(this).balance);
        } else {
            require(_amount <= address(this).balance);
            takeoutWallet.transfer(_amount);
        }
    }
}