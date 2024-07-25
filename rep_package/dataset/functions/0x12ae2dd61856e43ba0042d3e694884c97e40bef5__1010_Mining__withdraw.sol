contract _1010_Mining_ {
function withdraw () external { 
        // Pre-validate withdrawal
        require(members[msg.sender].unpaid > 1, "No unpaid balance or not a member account");
        
        // Remember members unpaid amount but remove it from his contract holdings before initiating the withdrawal for security reasons
        uint256 unpaid = members[msg.sender].unpaid.sub(1);
        members[msg.sender].unpaid = 1;
        
        // Trigger 'Withdraw'-event
        emit Withdraw(msg.sender, unpaid);
        
        // Transfer the unpaid Wei amount to member address
        msg.sender.transfer(unpaid);
    }
}