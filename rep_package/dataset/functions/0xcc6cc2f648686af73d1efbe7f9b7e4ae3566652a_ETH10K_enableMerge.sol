contract ETH10K {
function enableMerge (bool status) onlyAdmins() public {
    mergeEnabled = status;
  }
}