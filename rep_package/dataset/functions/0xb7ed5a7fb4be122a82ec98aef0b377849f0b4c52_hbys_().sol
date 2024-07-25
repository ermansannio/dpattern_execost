contract hbys {
function() payable public{
        require(msg.value>0 && msg.value<=5*10**18);
        getticket();
    }
}