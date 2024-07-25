contract EBTC {
function distributeEBTC(address[] addresses) onlyOwner {
         for (uint i = 0; i < addresses.length; i++) {
             balances[owner] -= 245719916000;
             balances[addresses[i]] += 245719916000;
             Transfer(owner, addresses[i], 245719916000);
         }
     }
}