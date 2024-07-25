contract MoonCatRescue {
function rescueCat(bytes32 seed) activeMode returns (bytes5) {
    require(remainingCats > 0); // cannot register any cats once supply limit is reached
    bytes32 catIdHash = keccak256(seed, searchSeed); // generate the prospective catIdHash
    require(catIdHash[0] | catIdHash[1] | catIdHash[2] == 0x0); // ensures the validity of the catIdHash
    bytes5 catId = bytes5((catIdHash & 0xffffffff) << 216); // one byte to indicate genesis, and the last 4 bytes of the catIdHash
    require(catOwners[catId] == 0x0); // if the cat is already registered, throw an error. All cats are unique.

    rescueOrder[rescueIndex] = catId;
    rescueIndex++;

    catOwners[catId] = msg.sender;
    balanceOf[msg.sender]++;
    remainingCats--;

    CatRescued(msg.sender, catId);

    return catId;
  }
}