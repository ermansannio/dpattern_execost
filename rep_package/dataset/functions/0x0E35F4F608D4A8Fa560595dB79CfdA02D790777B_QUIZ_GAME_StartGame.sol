contract QUIZ_GAME {
function StartGame(string _question,string _response)
    public
    payable
    {
        if(responseHash==0x00)
        {
            responseHash = keccak256(_response);
            question = _question;
            questionSender = msg.sender;
        }
    }
}