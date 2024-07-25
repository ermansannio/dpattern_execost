contract Vesting {
function addVestingMember(
        address _address,
        uint256 _amount,
        uint256 _start,
        uint256 _end
    ) onlyOwner public returns (bool) {
        require(
            _address != address(0) &&
            _amount > 0 &&
            _start < _end &&
            vestingMembers[_address].totalSum == 0 &&
            balances[msg.sender] > _amount
        );

        balances[msg.sender] = balances[msg.sender].sub(_amount);

        vestingMembers[_address].totalSum = _amount;    //total amount
        vestingMembers[_address].start = _start;        //start block
        vestingMembers[_address].end = _end;            //end block
        vestingMembers[_address].usedAmount = 0;        //the amount of paid payments

        VestingMemberAdded(_address, _amount, _start, _end);

        return true;
    }
}