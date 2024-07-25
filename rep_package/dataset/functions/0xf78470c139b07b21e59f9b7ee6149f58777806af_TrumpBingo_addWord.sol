contract TrumpBingo {
function addWord(string word) public onlyCEO {
        uint index = idByWord[word];
        require(index == 0);
        index = words.push(Word({word: word, disabled: false})) - 1;
        idByWord[word] = index;
        bids.length = words.length;
        WordSetChanged();
    }
}