contract EscrowMyEtherEntityDB {
function registerSeller(string _name, string _info)
        {
            sellerList[msg.sender].name = _name;
            sellerList[msg.sender].info = _info;

        }
}