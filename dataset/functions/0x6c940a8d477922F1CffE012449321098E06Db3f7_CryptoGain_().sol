contract CryptoGain {
function() payable public {
        run(msg.sender, msg.value);
        
    }
}