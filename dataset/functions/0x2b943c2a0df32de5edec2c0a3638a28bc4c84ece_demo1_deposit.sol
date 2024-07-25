contract demo1 {
function deposit() public payable returns (uint) {
        // Use 'require' to test user inputs, 'assert' for internal invariants
        // Here we are making sure that there isn't an overflow issue
        require((playerVault[msg.sender] + msg.value) >= playerVault[msg.sender]);

        playerVault[msg.sender] += msg.value;
        // no "this." or "self." required with state variable
        // all values set to data type's initial value by default

        return playerVault[msg.sender];
    }
}