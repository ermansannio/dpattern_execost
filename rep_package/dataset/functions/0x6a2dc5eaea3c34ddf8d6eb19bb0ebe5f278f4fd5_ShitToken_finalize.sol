contract ShitToken {
function finalize() minCapReached salePeriodCompleted isValidState onlyBy(owner) external {
        // Upon successful completion of sale, send tokens to SHIT fund
        balances[shitFundAddress] = balances[shitFundAddress].add(shitFund);
        assignedSupply = assignedSupply.add(shitFund);
        ClaimSHIT(shitFundAddress, shitFund);   // Log tokens claimed by SHIT International SHIT fund
        Transfer(0x0, shitFundAddress, shitFund);
        
        // In the case where not all 100M Shit allocated to crowdfund participants
        // is sold, send the remaining unassigned supply to Shit fund address,
        // which will then be used to fund the user growth pool.
        if (assignedSupply < totalSupply) {
            uint256 unassignedSupply = totalSupply.sub(assignedSupply);
            balances[shitFundAddress] = balances[shitFundAddress].add(unassignedSupply);
            assignedSupply = assignedSupply.add(unassignedSupply);

            ClaimSHIT(shitFundAddress, unassignedSupply);  // Log tokens claimed by Shit International SHIT fund
            Transfer(0x0, shitFundAddress, unassignedSupply);
        }

        ethFundAddress.transfer(this.balance);

        isFinalized = true; // Finalize sale
    }
}