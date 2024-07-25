contract ProofOfExistence {
function notarize(string sha256) {
    storeProof(sha256);
  }
}