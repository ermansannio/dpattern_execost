contract CellTokens {
function enableMerge (bool status) onlyAdmins() public {
    mergeEnabled = status;
  }
}