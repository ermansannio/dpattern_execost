contract Etheriumx {
function mint() public payable {
        require(balanceOf[msg.sender] + _value >= balanceOf[msg.sender]); // Check for overflows
        uint256 _value = msg.value / 100000000;

        updateSupply();

        require(unspent_supply - _value <= unspent_supply);
        unspent_supply -= _value; // Remove from unspent supply
        balanceOf[msg.sender] += _value; // Add the same to the recipient

        updateSupply();

        /* Notify anyone listening that the minting took place */
        Mint(msg.sender, _value);

    }
}