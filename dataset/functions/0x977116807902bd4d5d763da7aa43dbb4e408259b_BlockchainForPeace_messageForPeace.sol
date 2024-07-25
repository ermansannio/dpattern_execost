contract BlockchainForPeace {
function messageForPeace(string _message) payable public {
        require(msg.value > 0);
        donations.push(Donation(msg.sender, _message, msg.value));
        charity.transfer(msg.value);
        raised += msg.value;
        emit Donate(msg.sender, msg.value, _message);
    }
}