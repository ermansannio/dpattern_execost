contract EscrowMyEtherEntityDB {
function registerBuyer(string _name, string _info)
        {
           
            buyerList[msg.sender].name = _name;
            buyerList[msg.sender].info = _info;

        }
}