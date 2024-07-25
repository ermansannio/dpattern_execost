contract LEToken {
function SendEthOn() {
       require(msg.sender == owner); 
       SendEth = true;
   }
}