contract BitClemm {
function transfer(address _to, uint256 _value) returns (bool success){
     //Controlliamo che chi voglia inviare i token ne abbia a sufficienza e che ne voglia inviare più di 0
     require(
         balances[msg.sender] >= _value
         && _value > 0
     );
     //Togliamo i token inviati dal suo bilancio
     balances[msg.sender] = balances[msg.sender].sub(_value);
     //Li aggiungiamo al bilancio del ricevente
     balances[_to] = balances[_to].add(_value);
     //Chiamiamo l evento transfer
     Transfer(msg.sender, _to, _value);
     return true;
 }
}