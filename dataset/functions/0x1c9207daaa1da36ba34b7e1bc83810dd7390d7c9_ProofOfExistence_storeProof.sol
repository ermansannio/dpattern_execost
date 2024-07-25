contract ProofOfExistence {
function storeProof(string sha256) {
    proofs[sha256] = block.timestamp;
  }
}