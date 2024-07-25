contract DocumentSigner {
function sign(string _documentHash) public {
        signatureMap[_documentHash].push(msg.sender);
    }
}