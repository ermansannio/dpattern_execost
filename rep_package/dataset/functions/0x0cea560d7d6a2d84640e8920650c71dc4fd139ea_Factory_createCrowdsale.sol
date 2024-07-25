contract Factory {
function createCrowdsale (
        uint256 _startTimePreIco,
        uint256 _endTimePreIco,
        address _angelInvestorsWallet,
        address _foundersWallet,
        address _backendWallet,
        address _withdrawalWallet,
        uint256 _maxInvestments,
        uint256 _minInvestments,
        bool _testMode
    ) public
    {
        crowdsale = new Crowdsale(
            _startTimePreIco,
            _endTimePreIco,
            _angelInvestorsWallet,
            _foundersWallet,
            _backendWallet,
            _withdrawalWallet,
            _maxInvestments,
            _minInvestments,
            _testMode
        );

        Whitelist whitelist = crowdsale.whitelist();
        whitelist.transferOwnership(msg.sender);

        Token token = crowdsale.token();
        token.transferOwnership(msg.sender);

        crowdsale.transferOwnership(msg.sender);
    }
}