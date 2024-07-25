contract GiftCard2017 {
function withdraw(uint256 _amount) public OwnerOnly {
        owner.transfer(_amount);
    }
}