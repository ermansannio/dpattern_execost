contract Dividends {
function Buy(address target, uint256 maxamount, uint256 maxprice) public payable {
        require(SellOrders[target][0] > 0);
        require(SellOrders[target][1] <= maxprice);
        uint256 price = SellOrders[target][1];
        uint256 amount_buyable = (mul(msg.value, uint256(10**decimals))) / price; 
        
        // decide how much we buy 
        
        if (amount_buyable > SellOrders[target][0]){
            amount_buyable = SellOrders[target][0];
        }
        if (amount_buyable > maxamount){
            amount_buyable = maxamount;
        }
        //10000000000000000000,1000
        //"0xca35b7d915458ef540ade6068dfe2f44e8fa733c",10000000000000000000,1000
        uint256 total_payment = mul(amount_buyable, price) / (uint256(10 ** decimals));
        
        // Let's buy tokens and actually pay, okay?
        require(amount_buyable > 0 && total_payment > 0); 
        
        // From the amount we actually pay, we take exchange fee from it 
        
        uint256 Fee = mul(total_payment, SellFee) / 10000;
        uint256 Left = total_payment - Fee; 
        
        uint256 Excess = msg.value - total_payment;
        
        uint256 OldTokensSeller = balanceOf[target];
        uint256 OldTokensBuyer = balanceOf[msg.sender];

        // Change it in memory 
        _forceTransfer(target, msg.sender, amount_buyable);
        
        // Pay out withdrawals and reset timer
        // Prevents double withdrawals in same tx
        
        // Change sell order 
        SellOrders[target][0] = sub(SellOrders[target][0],amount_buyable);
        
        
        // start all transfer stuff 

        uint256 _sendTarget = _withdraw(target, OldTokensSeller, false);
        uint256 _sendBuyer = _withdraw(msg.sender, OldTokensBuyer, false );
        
        // in one transfer saves gas, but its not nice in the etherscan logs 
        target.transfer(add(Left, _sendTarget));
        
        if (add(Excess, _sendBuyer) > 0){
            msg.sender.transfer(add(Excess,_sendBuyer));
        }
        
        if (Fee > 0){
            owner.transfer(Fee);
        }
     
        emit SellOrderFilled(msg.sender, target, amount_buyable,  price, Left);
    }
}