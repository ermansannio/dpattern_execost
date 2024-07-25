contract Share {
function withdrawal() public notPaused {
        if (holds[msg.sender] == 0) {
            //you don't have any, don't bother
            return;
        }
        uint256 value = bonus();
        fullfilled[msg.sender] = watermark;

        msg.sender.transfer(value);

        emit WITHDRAWAL(msg.sender, value);
    }
}