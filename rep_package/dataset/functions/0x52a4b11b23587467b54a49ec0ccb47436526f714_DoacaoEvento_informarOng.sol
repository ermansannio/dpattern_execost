contract DoacaoEvento {
function informarOng(address _ong) public apenasResponsavel {
        emit LogOngInformada(_ong);
        ong = _ong;
    }
}