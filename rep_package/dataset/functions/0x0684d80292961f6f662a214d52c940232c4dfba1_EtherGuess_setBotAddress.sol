contract EtherGuess {
function setBotAddress(address newBot) onlyAdmin public {
        bot = newBot;
    }
}