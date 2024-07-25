contract DecenterHackathon {
function contributeToPrizePool(string _name, string _siteUrl, string _logoUrl) payable {
        require(currentPeriod != Period.End);
        require(msg.value >= 0.1 ether);

        sponsors.push(Sponsor({
            name: _name,
            siteUrl: _siteUrl,
            logoUrl: _logoUrl,
            ethAddress: msg.sender,
            contribution: msg.value
        }));

        totalContribution += msg.value;
        SponsorshipReceived(_name, _siteUrl, _logoUrl, msg.value);
    }
}