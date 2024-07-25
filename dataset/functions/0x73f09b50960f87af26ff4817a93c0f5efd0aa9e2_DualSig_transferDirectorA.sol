contract DualSig {
function transferDirectorA(address newDirectorA) public payable {
        require(msg.sender==directorA);
        require(msg.value==transferSafety);// Prevents accidental transfer
        directorA.transfer(transferSafety);// Reimburse safety deposit
        reset();
        directorA = newDirectorA;
        emit NewDirectorA(directorA);
    }
}