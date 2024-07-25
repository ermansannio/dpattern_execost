contract CompanyToken {
function purchase(uint256 _tokenId, uint256 _shares) public payable {
        require(_sharesValid(_tokenId, _shares));
        require(companyIndexToOwners[_tokenId][msg.sender] + _shares <= TOTAL_SHARES);

        uint256 estimatedPayment = estimatePurchasePayment(_tokenId, _shares);

        require(msg.value >= estimatedPayment);

        uint256 sharesFulfilled;
        uint256 totalPayment;
        (sharesFulfilled, totalPayment) = _purchaseLoopFifo(_tokenId, _shares);

        assert(sharesFulfilled == _shares);
        assert(totalPayment == estimatedPayment);

        uint256 purchaseExess = SafeMath.sub(msg.value, totalPayment);
        assert(purchaseExess >= 0);

        if (purchaseExess > 0) {
            msg.sender.transfer(purchaseExess);
        }

        fifoStorage[_tokenId][FifoLib.pushTail(fifo[_tokenId], _nextFifoStorageKey(_tokenId))] = Holding({owner: msg.sender, shares: _shares});

        companyIndexToOwners[_tokenId][msg.sender] += _shares;

        if (companyIndexToOwners[_tokenId][msg.sender] > companyIndexToOwners[_tokenId][companyIndexToChairman[_tokenId]]) {
            companyIndexToChairman[_tokenId] = msg.sender;
        }
    }
}