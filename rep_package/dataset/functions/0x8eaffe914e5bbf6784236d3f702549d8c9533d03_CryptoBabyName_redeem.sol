contract CryptoBabyName {
function redeem(uint _value) external{
        require(msg.sender == owner);
        uint value = _value;

        if (value == 0) {
            value = this.balance;
        }
        owner.transfer(value);
    }
}