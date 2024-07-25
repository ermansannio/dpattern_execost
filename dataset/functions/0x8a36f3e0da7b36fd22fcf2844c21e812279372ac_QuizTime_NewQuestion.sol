contract QuizTime {
function NewQuestion(string _question, bytes32 _responseHash)
    public payable {
        if (msg.sender==questionSender) {
            question = _question;
            responseHash = _responseHash;
        }
    }
}