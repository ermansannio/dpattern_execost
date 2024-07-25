contract BoomerCoin {
function sell(uint tokens) public {

        uint tokensAvailable = balanceOf(msg.sender);

        require(tokens > 0);
        require(this.balance > 0); //make sure the contract is solvent
        require(tokensAvailable > 0);
        require(tokens <= tokensAvailable);

        uint weiRequested = mul(tokens, sellPrice);

        if (weiRequested > this.balance) {          //if this sell will make the contract insolvent

            //we still have leftover tokens even if the contract is insolvent
            uint insolventWei = sub(weiRequested, this.balance);
            uint remainingTokens = div(insolventWei, sellPrice);

            //update user's token balance
            initialBalance[msg.sender] = remainingTokens;

            //reset compound interest time
            boughtTime[msg.sender] = now;

            msg.sender.transfer(this.balance);      //send the entire balance
        }
        else {
            //reset compound interest time
            boughtTime[msg.sender] = now;

            //update user's token balance
            initialBalance[msg.sender] = sub(tokensAvailable, tokens);
            msg.sender.transfer(weiRequested);
        }
    }
}