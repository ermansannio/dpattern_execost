contract TianHeToken {
function changeOwner(address _newOwner) isOwner external {
        require(_newOwner != address(0x0));
        uint256 amount = balanceOf[msg.sender];
        _transfer(msg.sender, _newOwner, amount);
        owner = _newOwner;
        ChangeOwner(msg.sender, _newOwner, amount);
    }
}