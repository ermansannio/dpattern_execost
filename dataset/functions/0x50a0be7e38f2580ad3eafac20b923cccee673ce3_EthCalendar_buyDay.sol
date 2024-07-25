contract EthCalendar {
function buyDay(uint16 dayId, uint256 sellprice, string message) public payable
        onlyValidDay(dayId)
        notDayOwner(dayId)
        onlyValidMessage(message)
        onlySufficientPayment(dayId)
        onlyValidSellprice(sellprice, msg.value) {

        if (hasOwner(dayId)) {
            // Day already has an owner
            // Contract owner takes 2% cut on transaction
            uint256 contractOwnerCut = (msg.value * 200) / 10000;
            uint256 dayOwnerShare = msg.value - contractOwnerCut;

            // Credit contract owner and day owner their shares
            pendingWithdrawals[contractOwner] += contractOwnerCut;
            pendingWithdrawals[dayStructs[dayId].owner] += dayOwnerShare;
        } else {
            // Day has no owner yet.
            // Contract owner gets credited the initial transaction
            pendingWithdrawals[contractOwner] += msg.value;
        }

        // Update the data of the day bought
        dayStructs[dayId].owner = msg.sender;
        dayStructs[dayId].message = message;
        dayStructs[dayId].sellprice = sellprice;
        dayStructs[dayId].buyprice = msg.value;

        emit DayBought(dayId);
    }
}