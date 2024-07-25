contract _1010_Mining_ {
function () external payable {
        // Distribute deposited Ether to all members related to their profit-share
        for (uint i=0; i<memberIndex.length; i++) {
            members[memberIndex[i]].unpaid = 
                // Adding current deposit to members unpaid Wei amount
                members[memberIndex[i]].unpaid.add(
                    // MemberShare * DepositedWei / 100 = WeiAmount of member-share to be added to members unpaid holdings
                    members[memberIndex[i]].share.mul(msg.value).div(100)
                );
        }
        
        // Trigger 'Deposit'-event
        emit Deposit(msg.sender, msg.value);
    }
}