contract BitClemm {
function approve(address _spender, uint256 _value) returns (bool success){
     //Inseriamo l'indirizzo del delegato e il massimo che può inviare
     allowed[msg.sender][_spender] = _value;
     //Chiamiamo l'evento approval
     Approval(msg.sender, _spender, _value);
     return true;
 }
}