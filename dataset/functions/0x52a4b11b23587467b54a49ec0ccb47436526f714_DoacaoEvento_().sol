contract DoacaoEvento {
function() public payable {
        require(msg.value > 0 && statusDoacao == StatusDoacao.ABERTO);
        emit LogDoacaoRecebida(msg.sender, msg.value);
        Doador memory d = Doador(msg.sender, msg.value, block.timestamp);
        doadores.push(d);
    }
}