contract Moods {
function changeMood(string _mood) public payable{
    
    require(possibleMoods[_mood] == true);
    
    currentMood = _mood;
    
    emit moodChanged(msg.sender, _mood);
}
}