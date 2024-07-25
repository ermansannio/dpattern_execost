contract PresageFlower {
function addDiary(string body) public onlyAuthor {
        diaries.push(Diary(msg.sender, body, now));
    }
}