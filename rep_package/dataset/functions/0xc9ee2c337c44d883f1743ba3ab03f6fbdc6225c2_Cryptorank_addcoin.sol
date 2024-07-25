contract Cryptorank {
function addcoin(string _name,string _symbol) 
       public
       payable
       isRepeat(_name)
    {
        require(addcoinslimit > 1);
        
        if(msg.sender != owner){
            require(msg.value >= addcoinfee);
            
        }
        
        uint id = coinSorting.push(Coin(_symbol,_name, 0)) - 1;

        cvotes[_name]=id;

        emit AddCoin(id,_name,_symbol);

        have[_name]=true;
        
        addcoinslimit --;
        
        rounds[roundid].jackpot =   rounds[roundid].jackpot.add(msg.value);
    }
}