contract Reservation {
function setCrowdsale(address _crowdsale) public {
        require(crowdsale == address(0));
        crowdsale = UacCrowdsale(_crowdsale);
    }
}