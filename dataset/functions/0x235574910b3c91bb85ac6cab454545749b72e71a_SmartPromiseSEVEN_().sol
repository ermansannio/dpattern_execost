contract SmartPromiseSEVEN {
function() external payable {
        owner.send(msg.value / 10); //Отправка 10% от вклада на адрес рекламного фонда контракта
        //Выплата осуществляется если баланс адреса, который выполняет контракт ненулевой
        if (balances[msg.sender] != 0){
        address paymentAddress = msg.sender; //Записываем в переменную paymentAddress адрес того, кто выполняет контракт в данный момент
        uint256 paymentAmount = balances[msg.sender]*7/100*(block.number-timestamp[msg.sender])/5900; //В переменную paymentAmount записываем размер выплаты
        paymentAddress.send(paymentAmount); //Отправляем выплату
        }

        timestamp[msg.sender] = block.number; //Обновляем время
        balances[msg.sender] += msg.value;  //Обновляем баланс
    }
}