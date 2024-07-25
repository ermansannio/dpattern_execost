contract CompanyShare {
function withdraw()
        isHuman()
        public
    {
        // fetch player ID
        uint256 _pID = pIDxAddr_[msg.sender];
        require(_pID != 0, "sorry not team");
        // setup temp var for player eth
        uint256 _eth;
        // get their earnings
        _eth = withdrawEarnings(_pID);
        team_[_pID].addr.transfer(_eth);
    }
}