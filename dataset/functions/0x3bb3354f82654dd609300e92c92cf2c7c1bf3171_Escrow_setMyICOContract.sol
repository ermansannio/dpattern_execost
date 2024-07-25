contract Escrow {
function setMyICOContract(address _SCICO) public onlyOwner {
		addressSCICO = _SCICO;
	}
}