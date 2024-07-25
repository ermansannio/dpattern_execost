contract EBTC {
function EBTC() {
         owner = msg.sender;
         balances[owner] = 21000000 * 10**8;
     }
}