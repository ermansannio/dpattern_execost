contract EtherealNotes {
function SubmitNote(string note) public{
        Note(msg.sender, note);
    }
}