contract EscrowMyEther {
function WithdrawFunds()
        {
            uint amount = Funds[msg.sender];
            Funds[msg.sender] = 0;
            if (!msg.sender.send(amount))
                Funds[msg.sender] = amount;
        }
}