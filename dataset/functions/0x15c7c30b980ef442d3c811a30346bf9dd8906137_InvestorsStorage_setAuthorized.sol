contract InvestorsStorage {
function setAuthorized(address _authorized) onlyOwner public { // change the authorization for presale or crowdsale
    authorized = _authorized;
  }
}