contract EscrowMyEther {
function buyerFundRelease(uint ID)
        {
            require(ID < buyerDatabase[msg.sender].length && 
            buyerDatabase[msg.sender][ID].release_approval == false &&
            buyerDatabase[msg.sender][ID].refund_approval == false);
            
            //Set release approval to true. Ensure approval for each transaction can only be called once.
            buyerDatabase[msg.sender][ID].release_approval = true;

            address seller = buyerDatabase[msg.sender][ID].seller;
            address escrow_agent = buyerDatabase[msg.sender][ID].escrow_agent;

            uint amount = buyerDatabase[msg.sender][ID].amount;
            uint escrow_fee = buyerDatabase[msg.sender][ID].escrow_fee;

            //Move funds under seller's owership
            Funds[seller] += amount;
            Funds[escrow_agent] += escrow_fee;


        }
}