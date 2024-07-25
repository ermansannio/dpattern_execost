contract Etheramid {
function enter(address inviter) public {
        uint amount = msg.value;
        if ((amount < contribution) || (Tree[msg.sender].inviter != 0x0) || (Tree[inviter].inviter == 0x0)) {
            msg.sender.send(msg.value);
            return;
        }
        
        addParticipant(msg.sender, inviter);
        address next = inviter;
        uint rest = amount;
        uint level = 1;
        while ( (next != top) && (level < 7) ){
            uint toSend = rest/2;
            next.send(toSend);
            Tree[next].totalPayout += toSend;
            rest -= toSend;
            next = Tree[next].inviter;
            level++;
        }
        next.send(rest);
		Tree[next].totalPayout += rest;
    }
}