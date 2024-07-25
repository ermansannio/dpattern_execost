contract EscrowMyEther {
function escrowDecision(uint ID, uint Decision)
        {
            //Escrow can only make the decision IF
            //1) Buyer has not yet approved fund release to seller
            //2) Seller has not yet approved a refund to buyer
            //3) Escrow Agent has not yet approved fund release to seller AND not approved refund to buyer
            //4) Escalation Escalation is activated

            address buyerAddress = escrowDatabase[msg.sender][ID].buyer;
            uint buyerID = escrowDatabase[msg.sender][ID].buyer_nounce;
            

            require(
            buyerDatabase[buyerAddress][buyerID].release_approval == false &&
            buyerDatabase[buyerAddress][buyerID].escrow_intervention == true &&
            buyerDatabase[buyerAddress][buyerID].refund_approval == false);
            
            uint escrow_fee = buyerDatabase[buyerAddress][buyerID].escrow_fee;
            uint amount = buyerDatabase[buyerAddress][buyerID].amount;

            if (Decision == 0) //Refund Buyer
            {
                buyerDatabase[buyerAddress][buyerID].refund_approval = true;    
                Funds[buyerAddress] += amount;
                Funds[msg.sender] += escrow_fee;
                
            } else if (Decision == 1) //Release funds to Seller
            {                
                buyerDatabase[buyerAddress][buyerID].release_approval = true;
                Funds[buyerDatabase[buyerAddress][buyerID].seller] += amount;
                Funds[msg.sender] += escrow_fee;
            }  
        }
}