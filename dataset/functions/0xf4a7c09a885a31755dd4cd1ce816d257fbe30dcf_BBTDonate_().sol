contract BBTDonate {
function () payable public {
        record[msg.sender] = add(record[msg.sender], msg.value);
        totalReceive = add(totalReceive, msg.value);
    }
}