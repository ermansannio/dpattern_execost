contract NoteChain {
function updateNoteContent(uint64 _noteId, bytes _content) external notDeleted(_noteId) onlyOwnerOf(_noteId) payable payFee {
                Note storage myNote = notes[_noteId];
                myNote.content = _content;
        }
}