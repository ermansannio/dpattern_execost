contract LcommaG {
function gift_ClaimTINAmotleyLine(uint256 _tokenId) external returns(bool){
        require(_tokenId < listTINAmotleyTotalSupply);
        require(listTINAmotleyIndexToAddress[_tokenId] == address(0));
        listTINAmotleyIndexToAddress[_tokenId] = msg.sender;
        listTINAmotleyBalanceOf[msg.sender]++;
        listTINAmotleyBalanceOf[address(0)]--;
        emit Claim(_tokenId, msg.sender);
        return true;
    }
}