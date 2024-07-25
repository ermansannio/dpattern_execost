contract DualSig {
function transferDirectorB(address newDirectorB) public payable {
        require(msg.sender==directorB);
        require(msg.value==transferSafety);// Prevents accidental transfer
        directorB.transfer(transferSafety);// Reimburse safety deposit
        reset();
        directorB = newDirectorB;
        emit NewDirectorB(directorB);
    }
}