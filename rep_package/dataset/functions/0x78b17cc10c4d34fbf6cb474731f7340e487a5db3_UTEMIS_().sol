contract UTEMIS {
function () payable public icoStarted minValue{                              
        uint amount_actually_invested = investorsList[msg.sender].amount;           //Get the actually amount invested
        
        if(amount_actually_invested == 0){                                          //If amount invested are equal to 0, will add like new investor
            uint index                = investorsAddress.length++;
            investorsAddress[index]   = msg.sender;
            investorsList[msg.sender] = Investors(msg.value , now);                 //Store investors info        
        }
        
        if(amount_actually_invested > 0){                                           //If amount invested are greater than 0
            investorsList[msg.sender].amount += msg.value;                          //Increase the amount invested
            investorsList[msg.sender].when    = now;                                //Change the last time invested
        }

        uint tokensToSend = getTokensToSend(msg.value);                             //Calc the tokens to send depending on ethers received
        remaining -= tokensToSend;                                                  //Subtract the tokens to send to remaining tokens        
        _transfer(owner , msg.sender , tokensToSend);                               //Transfer tokens to investor
        
        require(balance_[owner] >= (TOTAL_SUPPLY - ICO_SUPPLY));                     //Requires not selling more tokens than those proposed in the ico        
        require(balance_[owner] >= tokensToSend);
        
        if(address(beneficiary) == 0){                                              //Check if beneficiary is not setted
            beneficiary = owner;                                                    //If not, set the beneficiary to owner
        }    
        ethers_collected += msg.value;                                              //Increase ethers_collected   
        ethers_balance   += msg.value;
        if(!beneficiary.send(msg.value)){
            revert();
        }                                                //Send ethers to beneficiary

        FundTransfer(owner , msg.value , msg.sender);                               //Fire events for clients
    }
}