contract DualSig {
function accept(uint256 acceptNonce) public onlyDirectors {
        require(proposalNonce == acceptNonce);
        require(proposalAmount > 0);
        require(proposalDestination != 0x0);
        require(proposalAuthor != msg.sender || block.number >= proposalBlock);

        address localContract = proposalContract;
        address localDestination = proposalDestination;
        uint256 localAmount = proposalAmount;
        reset();

        if (localContract==0x0) {
            require(localAmount <= address(this).balance);
            localDestination.transfer(localAmount);
        }
        else {
            contractInterface tokenContract = contractInterface(localContract);
            tokenContract.transfer(localDestination, localAmount);
        }
        emit Accept(acceptNonce);
    }
}