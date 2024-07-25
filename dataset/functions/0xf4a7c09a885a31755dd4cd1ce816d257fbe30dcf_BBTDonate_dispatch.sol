contract BBTDonate {
function dispatch (address _receiver, uint256 _amount, string log) onlyAdmin public {
        require(bytes(log).length != 0);
        require(_receiver.send(_amount));
    }
}