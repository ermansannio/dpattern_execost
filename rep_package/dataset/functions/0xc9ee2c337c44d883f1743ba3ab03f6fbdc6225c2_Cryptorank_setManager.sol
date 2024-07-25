contract Cryptorank {
function setManager(address _manager) public  onlyowner{
	   
	   manager = _manager;
	}
}