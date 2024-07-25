contract Cryptorank {
function registerNameXNAME(string _nameString,address _inviter) 
        public
        payable {
        // make sure name fees paid
        require (msg.value >= 0.01 ether, "umm.....  you have to pay the name fee");

        bytes32 _name = NameFilter.nameFilter(_nameString);

        require(verifyName[_name]!=1 ,"sorry that names already taken");
        
        bool state =   validation_inviter(_inviter);
        require(state,"注册失败");
        if(!pState[msg.sender]){
            
            verifyName[_name] = 1;
            playername[msg.sender] = _nameString;
            playerreferees[msg.sender] = _inviter;
            pState[msg.sender] = true;
        }

        manager.transfer(msg.value);
    }
}