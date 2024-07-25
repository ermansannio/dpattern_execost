contract NoteChain {
function createNote(uint16 _metadata, bytes2 _publicKey, bytes12 _title, bytes _content) external payable payFee {
                uint64 id = uint64(notes.push(Note(_metadata, _publicKey, _title, _content))) - 1;
                noteToOwner[id] = msg.sender;
                ownerNotes[msg.sender].push(id);
                emit NoteCreated(id, _publicKey);
        }
}