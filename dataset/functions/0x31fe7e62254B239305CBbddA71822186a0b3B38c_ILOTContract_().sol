contract ILOTContract {
function () public payable {

        /*
            Owner cannot play lottery.
        */
        if (msg.sender == owner) {
            return;
        }

        if (msg.value > 0) {

            /*
                Maintenance fee 2%
            */
            uint mfee = (2 * msg.value) / 100;

            /*
                If the contract does not have sufficient balance to pay mfee,
                it will add mfee to maintenanceDebt and will not transfer it
                at this time. During a later transaction, if the fee is enough,
                the previous debt is transferred and zeroed out.
            */
            if (address(this).balance >= mfee) {
                if (address(this).balance >= (mfee + maintenanceDebt) ) {
                    // there's enough to cover previous debt
                    owner.transfer(mfee + maintenanceDebt);
                    maintenanceDebt = 0;
                } else {
                    // enough to pay fee but not previous debts
                    owner.transfer(mfee);
                }

            } else {
                maintenanceDebt += mfee;
            }

            /*
                Convert ETH to ILOT at tokensPerEthereum rate.
            */
            uint tokenAmount = tokensPerEthereum * msg.value;
            if (tokenAmount > 0) {
                require( (balanceOf[msg.sender] + tokenAmount) > balanceOf[msg.sender]);

                /*
                    Pay fidelity bonus.
                */
                payBonus(msg.sender);

                /*
                    Pay interests on previous balance.
                */
                payInterest(msg.sender);

                /*
                    Update balance.
                */
                balanceOf[msg.sender] += tokenAmount;
                totalSupply += tokenAmount;
                Transfer(this, msg.sender, tokenAmount);

                /*
                    Add total after paying bonus.
                    This deposit will count towards the next deposit bonus.
                */
                depositTotal[msg.sender] += msg.value;

                string memory ats = addressToString(msg.sender);

                /*
                    Perform lottery routine.
                */
                current_jackpot_hash = keccak256(current_jackpot_hash, ats, block.coinbase, block.number, block.timestamp);
                uint diffx = hashDifficulty(current_jackpot_hash);

                if (diffx >= jackpotDifficulty) {
                    /*

                        ********************
                        ****  JACKPOT!  ****
                        ********************

                        Winner receives the entire contract balance.
                        Jackpot event makes the result public.

                    */
                    Jackpot(msg.sender, address(this).balance);
                    msg.sender.transfer(address(this).balance);
                }

                /*
                    Make the game result public for transparency.
                */
                GameResult(msg.sender, diffx);

            }
        }
    }
}