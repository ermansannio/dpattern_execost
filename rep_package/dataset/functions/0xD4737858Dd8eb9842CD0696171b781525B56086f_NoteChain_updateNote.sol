contract NoteChain {
function updateNote(uint64 _noteId, uint16 _metadata, bytes12 _title, bytes _content) external notDeleted(_noteId) onlyOwnerOf(_noteId) payable payFee {
                Note storage myNote = notes[_noteId];
                myNote.title = _title;
                myNote.metadata = _metadata;
                myNote.content = _content;
        }
}