contract MoonCatRescue {
function activate() onlyOwner inactiveMode {
    searchSeed = block.blockhash(block.number - 1); // once the searchSeed is set it cannot be changed;
    mode = Modes.Live; // once the contract is activated it's mode cannot be changed
  }
}