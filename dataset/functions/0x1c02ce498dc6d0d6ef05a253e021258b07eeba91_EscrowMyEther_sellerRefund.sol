contract EscrowMyEther {
function sellerRefund(uint ID)
        {
            address buyerAddress = sellerDatabase[msg.sender][ID].buyer;
            uint buyerID = sellerDatabase[msg.sender][ID].buyer_nounce;

            require(
            buyerDatabase[buyerAddress][buyerID].release_approval == false &&
            buyerDatabase[buyerAddress][buyerID].refund_approval == false); 

            address escrow_agent = buyerDatabase[buyerAddress][buyerID].escrow_agent;
            uint escrow_fee = buyerDatabase[buyerAddress][buyerID].escrow_fee;
            uint amount = buyerDatabase[buyerAddress][buyerID].amount;
        
            //Once approved, buyer can invoke WithdrawFunds to claim his refund
            buyerDatabase[buyerAddress][buyerID].refund_approval = true;

            Funds[buyerAddress] += amount;
            Funds[escrow_agent] += escrow_fee;
            
        }
}