contract ibaMultisig {
function createWallet(uint approvals, address[] owners, bytes32 name) external payable{

        /* check if name was actually given */
        require(name.length != 0);
        
        /*check if approvals num equals or greater than given owners num*/
        require(approvals <= owners.length);
        
        /* check if wallets with given name already exists */
        bool found;
        for (uint i = 0; i<wallets[msg.sender].length;i++){
            if (wallets[msg.sender][i].name == name){
                found = true;
            }
        }
        require (found == false);
        
        /*instantiate new wallet*/
        uint currentLen = wallets[msg.sender].length++;
        wallets[msg.sender][currentLen].name = name;
        wallets[msg.sender][currentLen].creator = msg.sender;
        wallets[msg.sender][currentLen].id = currentLen;
        wallets[msg.sender][currentLen].allowance = msg.value;
        wallets[msg.sender][currentLen].owners = owners;
        wallets[msg.sender][currentLen].appovalsreq = approvals;
        emit WalletCreated(currentLen);
    }
}