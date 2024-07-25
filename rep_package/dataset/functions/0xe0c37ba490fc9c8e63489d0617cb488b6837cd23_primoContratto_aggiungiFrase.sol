contract primoContratto {
function aggiungiFrase(string _frase) public returns (uint256) {
        frasi[frasiTotali] = _frase;
        frasiTotali++;
        return frasiTotali-1;
    }
}