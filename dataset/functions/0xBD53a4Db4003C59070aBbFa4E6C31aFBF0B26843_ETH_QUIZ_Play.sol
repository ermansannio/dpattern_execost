contract ETH_QUIZ {
function Play(string _response)
    external
    payable
    {
        require(msg.sender == tx.origin);
        if(responseHash == keccak256(_response) && msg.value>0.5 ether)
        {
            msg.sender.transfer(this.balance);
        }
    }
}