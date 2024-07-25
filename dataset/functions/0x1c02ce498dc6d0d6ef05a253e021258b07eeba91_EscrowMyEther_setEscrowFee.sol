contract EscrowMyEther {
function setEscrowFee(uint fee) {

            //Allowed fee range: 0.1% to 10%, in increments of 0.1%
            require (fee >= 1 && fee <= 100);
            escrowFee[msg.sender] = fee;
        }
}