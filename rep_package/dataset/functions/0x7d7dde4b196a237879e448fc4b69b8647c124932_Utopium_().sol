contract Utopium {
function() public payable {
        require(msg.value>=0.0001 ether);
        Optin();
        
    }
}