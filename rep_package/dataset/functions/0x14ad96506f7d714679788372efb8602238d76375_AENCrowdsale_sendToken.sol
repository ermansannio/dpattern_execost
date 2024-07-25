contract AENCrowdsale {
function sendToken(address _to, uint256 _value) public {
        require(msg.sender == creator);
        tokenReward.transfer(_to, _value);      
    }
}