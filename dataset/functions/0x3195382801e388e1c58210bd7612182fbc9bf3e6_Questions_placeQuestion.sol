contract Questions {
function placeQuestion(uint paymentForAnswer, uint8 maxAnswers, uint minVoteWeight, string text) external payable {
        require(maxAnswers > 0 && maxAnswers <= 32);
        require(msg.value == safeMul(paymentForAnswer, safeAdd(maxAnswers, 1)));
        require(paymentForAnswer >= safeAdd(minPaymentForAnswer, safeMul(minVoteWeight, minVoteWeightK)));
        uint len = bytes(text).length;
        require(len > 0 && len <= 1024);
        
        uint realPaymentForAnswer = paymentForAnswer / 2;
        uint realPaymentForVote = realPaymentForAnswer / votesForAnswer;
        
        int minVoteWeightI = int(minVoteWeight);
        require(minVoteWeightI >= 0);
        
        questions[currentQuestionId] = Question({
            creator: msg.sender,
            paymentForAnswer: realPaymentForAnswer,
            maxAnswers: maxAnswers,
            answerCount: 0,
            minVoteWeight: minVoteWeightI
        });
        PlaceQuestion(currentQuestionId, msg.sender, realPaymentForAnswer, maxAnswers, minVoteWeight, text);
        currentQuestionId++;
        
        changeVoteWeight(msg.sender, 1);
        
        ownerBalance += msg.value - (realPaymentForAnswer + realPaymentForVote * votesForAnswer) * maxAnswers;
        
        FundTransfer(msg.sender, msg.value, true);
    }
}