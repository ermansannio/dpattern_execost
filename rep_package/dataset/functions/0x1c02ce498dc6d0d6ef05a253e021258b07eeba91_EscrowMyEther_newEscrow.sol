contract EscrowMyEther {
function newEscrow(address sellerAddress, address escrowAddress, bytes32 notes) payable returns (bool) {

            require(msg.value > 0 && msg.sender != escrowAddress);
        
            //Store escrow details in memory
            EscrowStruct memory currentEscrow;
            TransactionStruct memory currentTransaction;
            
            currentEscrow.buyer = msg.sender;
            currentEscrow.seller = sellerAddress;
            currentEscrow.escrow_agent = escrowAddress;

            //Calculates and stores Escrow Fee.
            currentEscrow.escrow_fee = getEscrowFee(escrowAddress)*msg.value/1000;
            
            //0.25% dev fee
            uint dev_fee = msg.value/400;
            Funds[owner] += dev_fee;   

            //Amount seller receives = Total amount - 0.25% dev fee - Escrow Fee
            currentEscrow.amount = msg.value - dev_fee - currentEscrow.escrow_fee;

            //These default to false, no need to set them again
            /*currentEscrow.escrow_intervention = false;
            currentEscrow.release_approval = false;
            currentEscrow.refund_approval = false;  */ 
            
            currentEscrow.notes = notes;
 
            //Links this transaction to Seller and Escrow's list of transactions.
            currentTransaction.buyer = msg.sender;
            currentTransaction.buyer_nounce = buyerDatabase[msg.sender].length;

            sellerDatabase[sellerAddress].push(currentTransaction);
            escrowDatabase[escrowAddress].push(currentTransaction);
            buyerDatabase[msg.sender].push(currentEscrow);
            
            return true;

        }
}