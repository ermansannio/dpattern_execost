contract Countout {
function countUp(address _referralAddress) public payable {
        require (block.timestamp < lastTransactionTime + 7 days);    
        require (msg.value == nextPrice); 

        uint128 _price = uint128(msg.value);
        uint128 _processing;
      
        totalCount++;
        currentCount++; 

        _processing = _payFee(_price, _referralAddress);     
        
        if (currentCount > 1) {
            lastCountAddress.transfer(_processing);
        } else {
            sumPrice = sumPrice + _processing;
        }

        if (currentCount == randomCount) {
            Hit(msg.sender, currentCount);
            _renew(); 

        } else {
            if (currentCount == 7) {
                if (sevenWinnerAddresses.length < 7){
                    sevenWinnerAddresses.push(msg.sender);
                } else {

                    if (sumPrice <= bonusPrice) {
                        msg.sender.transfer(sumPrice);
                        sumPrice = 0;
                    } else {
                        msg.sender.transfer(bonusPrice);
                        sumPrice = sumPrice - bonusPrice;
                   }
                }
                _renew();
            } else {
                nextPrice = nextPrice * 3/2;
            }   

            Count(msg.sender, currentCount);            
        }
        _keepLastTransaction(); 
    }
}