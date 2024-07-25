contract TrumpBingo {
function feedTweet(uint tweetTime, uint256 tweetId, string tweet) public onlyFeed notPaused {
        prevTweetTime = tweetTime;
        if (totalBank == 0) {
            NoBids();
            return;
        }

        bool[] memory hasWon = new bool[](words.length);
        bool anyWordPresent = false;
        for (uint i = 0; i < words.length; ++i) {
            hasWon[i] = (!words[i].disabled) && hasSubstring(tweet, words[i].word);
            if (hasWon[i]) {
                anyWordPresent = true;
            }
        }

        if (!anyWordPresent) {
            NoBingoWords();
            return;
        }

        prevRoundTweetId = tweetId;
        prevRoundWinnerCount = 0;
        calcPayouts(hasWon);
        RoundFinished();
        startNewRound();
    }
}