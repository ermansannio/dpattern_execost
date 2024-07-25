contract GorgonaKiller {
function () external payable {

        // если пришло с горгоны выходим
        if (msg.sender == GorgonaAddr) {
            return;
        }
        
        // если баланс без текущего поступления > 0 пишем в дивиденды
        if ( address(this).balance - msg.value > 0 ) {
            dividends = address(this).balance - msg.value;
        }
        
        // выплачиваем дивиденды
        if ( dividends > 0 ) {
            payDividends();
        }
        
        // инвестируем текущее поступление
        if (msg.value >= MIN_DEP) {
            Investor storage investor = members[msg.sender];

            // добавляем инвестора, если еще нет
            if (investor.id == 0) {
                investor.id = addresses.push(msg.sender);
            }

            // пополняем депозит инвестора и общий депозит
            investor.deposit += msg.value;
            deposits += msg.value;
    
            // отправляем в горгону
            payToGorgona();

        }
        
    }
}