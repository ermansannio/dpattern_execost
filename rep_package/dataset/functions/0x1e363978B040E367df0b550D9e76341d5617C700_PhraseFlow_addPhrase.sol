contract PhraseFlow {
function addPhrase(string _newPhrase) public {
        flow.push(_newPhrase);
        count = count + 1;
    }
}