contract MyEtherTeller {
function EscrowEscalation(uint switcher, uint ID)
        {
            //To activate EscrowEscalation
            //1) Buyer must not have approved fund release.
            //2) Seller must not have approved a refund.
            //3) EscrowEscalation is being activated for the first time

            //There is no difference whether the buyer or seller activates EscrowEscalation.
            address buyerAddress;
            uint buyerID; //transaction ID of in buyer's history
            if (switcher == 0) // Buyer
            {
                buyerAddress = msg.sender;
                buyerID = ID;
            } else if (switcher == 1) //Seller
            {
                buyerAddress = sellerDatabase[msg.sender][ID].buyer;
                buyerID = sellerDatabase[msg.sender][ID].buyer_nounce;
            }

            require(buyerDatabase[buyerAddress][buyerID].escrow_intervention == false  &&
            buyerDatabase[buyerAddress][buyerID].release_approval == false &&
            buyerDatabase[buyerAddress][buyerID].refund_approval == false);

            //Activate the ability for Escrow Agent to intervent in this transaction
            buyerDatabase[buyerAddress][buyerID].escrow_intervention = true;

            
        }
}