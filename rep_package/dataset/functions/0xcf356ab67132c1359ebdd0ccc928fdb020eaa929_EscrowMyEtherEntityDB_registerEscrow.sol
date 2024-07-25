contract EscrowMyEtherEntityDB {
function registerEscrow(string _name, string _info)
        {
            escrowList[msg.sender].name = _name;
            escrowList[msg.sender].info = _info;
            
        }
}