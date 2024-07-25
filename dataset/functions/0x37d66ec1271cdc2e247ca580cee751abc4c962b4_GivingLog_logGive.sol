contract GivingLog {
function logGive(address _to, string _ipfs) public payable{
        require(msg.value > 0);
        _to.transfer(uint128(msg.value));
        emit Give(msg.sender, _to, uint128(msg.value), _ipfs);
    }
}