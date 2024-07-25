contract GiftCard2017 {
function authorize(address _addr, uint256 _amount_mEth) public OwnerOnly {
        require (this.balance >= _amount_mEth);
        authorizations[_addr] = _amount_mEth;
    }
}