contract TheDivine {
function rand() public returns(bytes32 result){
        uint256 complex = (nonce[msg.sender] % 11) + 10;
        result = keccak256(abi.encode(immotal, nonce[msg.sender]++));
        // Calculate digest by complex times
        for(uint256 c = 0; c < complex; c++){
            result = keccak256(abi.encode(result));
        }
        //Update new immotal result
        immotal = result;
        emit NewRand(msg.sender, complex, result);
        return;
    }
}