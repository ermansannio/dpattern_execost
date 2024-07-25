contract electrolightTestnet {
function mint(address receiver, uint amount) public {
        
        if(msg.sender != minter) return;
        balances[receiver]+=amount;
        
    }
}