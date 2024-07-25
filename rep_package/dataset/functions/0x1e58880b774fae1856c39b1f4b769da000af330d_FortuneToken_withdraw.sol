contract FortuneToken {
function withdraw(address _to) public onlyDev{
        if (_to != address(0)) {
            _to.transfer(this.balance);
        } else {
            admin.transfer(this.balance);
        }
    }
}