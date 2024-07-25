contract Admin {
function Test() public returns (uint256 _balance) {
            
        address sender = msg.sender;
        return sender.balance;
        
    }
}