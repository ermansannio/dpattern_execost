contract CarnieQuiz {
function StartQuiz(string question, string response)
    public payable {
        if (responseHash==0x0) {
            responseHash = keccak256(response);
            Question = question;
            questionSender = msg.sender;
        }
    }
}