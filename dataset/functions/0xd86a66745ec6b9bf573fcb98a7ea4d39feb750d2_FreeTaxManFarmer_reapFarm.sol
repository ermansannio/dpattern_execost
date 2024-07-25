contract FreeTaxManFarmer {
function reapFarm(address token_address) nonReentrant external {
        require(userInventory[msg.sender][token_address].workDone > 0);
        Corn(token_address).transfer(msg.sender, userInventory[msg.sender][token_address].workDone);
        userInventory[msg.sender][token_address].workDone = 0;
    }
}