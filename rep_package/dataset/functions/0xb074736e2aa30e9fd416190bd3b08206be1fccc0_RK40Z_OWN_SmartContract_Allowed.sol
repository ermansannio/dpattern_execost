contract RK40Z {
function OWN_SmartContract_Allowed(address target, bool _allowed) onlyOwner public {
		// function allowed only for smart contract
        if (isContract(target)) {
			SmartContract_Allowed[target] = _allowed;
		}
    }
}