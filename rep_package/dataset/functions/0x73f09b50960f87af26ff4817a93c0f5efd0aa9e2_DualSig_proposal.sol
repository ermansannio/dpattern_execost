contract DualSig {
function proposal(address proposalContractSet, uint256 proposalAmountSet, address proposalDestinationSet) public onlyDirectors {
        proposalNonce++;
        proposalAuthor = msg.sender;
        proposalContract = proposalContractSet;
        proposalAmount = proposalAmountSet;
        proposalDestination = proposalDestinationSet;
        proposalBlock = block.number + overrideBlock;
        emit Proposal(proposalNonce, proposalAuthor, proposalContract, proposalAmount, proposalDestination, proposalBlock);
    }
}