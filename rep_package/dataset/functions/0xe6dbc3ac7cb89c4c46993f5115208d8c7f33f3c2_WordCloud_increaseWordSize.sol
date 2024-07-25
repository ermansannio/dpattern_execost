contract WordCloud {
function increaseWordSize(string word) external payable {
    wordSizes[word] += msg.value;
    guyWhoGetsPaid.transfer(this.balance);
    WordSizeIncreased(word, wordSizes[word]);
  }
}