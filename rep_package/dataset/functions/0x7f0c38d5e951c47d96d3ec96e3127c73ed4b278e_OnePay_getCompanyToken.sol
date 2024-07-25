contract OnePay {
function getCompanyToken(uint256 amount) public onlyDirector returns (bool success)
    {
        amount = amount * 10 ** uint256(decimals);

        require((totalSupply + amount) <= tokenCap);

        balances[director] = amount;

        totalSupply += amount;

        return true;
    }
}