contract MultiSendEth {
function sendEth(address[] dests, uint256[] values) public payable {
        require(owner==msg.sender);
        require(dests.length == values.length);
        uint256 i = 0;
        while (i < dests.length) {
            require(this.balance>=values[i]);
            dests[i].transfer(values[i]);
            i++;
        }
    }
}