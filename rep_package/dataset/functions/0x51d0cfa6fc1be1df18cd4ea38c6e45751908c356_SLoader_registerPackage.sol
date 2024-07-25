contract SLoader {
function registerPackage(bytes32 checksum, string uri) public {
    packages[msg.sender] = Package(checksum, uri);
  }
}