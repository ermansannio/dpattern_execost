contract CryptoBabyName {
function babyBornEndVoting(string name, uint birthday) external returns(uint finalName){
        require(msg.sender == owner);

        bytes10 name10 = normalizeAndCheckName(bytes(name));
        finalName = leaderboard[name10];
        if (finalName != 0) {
            babyName = finalName;
            babyBirthday = birthday;
            BabyBorn(name, birthday);
        }
    }
}