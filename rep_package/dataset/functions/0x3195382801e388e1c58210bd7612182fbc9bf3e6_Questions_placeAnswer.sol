contract Questions {
function placeAnswer(uint questionId, string text) external {
        require(questions[questionId].creator != 0x0);
        require(questions[questionId].creator != msg.sender);
        require(!answers[questionId][msg.sender].placed);
        uint len = bytes(text).length;
        require(len > 0 && len <= 1024);
        require(questions[questionId].answerCount < questions[questionId].maxAnswers);
        require(voteWeight[msg.sender] >= questions[questionId].minVoteWeight);
        
        questions[questionId].answerCount++;
        answers[questionId][msg.sender] = Answer({
            placed: true,
            rating: 0,
            votes: 0
        });
        PlaceAnswer(questionId, msg.sender, text);
    }
}