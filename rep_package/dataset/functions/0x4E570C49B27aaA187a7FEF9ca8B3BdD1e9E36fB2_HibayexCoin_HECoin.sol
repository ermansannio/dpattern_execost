contract HibayexCoin {
function HECoin(address _distributor) public {
        balances[_distributor] = totalSupply;
        Transfer(0x0, _distributor, totalSupply);
    }
}