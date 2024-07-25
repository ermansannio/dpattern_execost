contract IngressRegistrar {
function register(bytes32 name, bytes32 version, bytes32 hashTypeName, string checksum) public 
	    contractIsActive
	    manifestIsValid(name, version, hashTypeName, checksum, msg.sender) {
	    
	    // Generate ID for this manifest
	    bytes32 manifestId = keccak256(msg.sender, name, version);
	    
	    // Generate registrant name index
	    bytes32 registrantNameIndex = keccak256(msg.sender, name);

        Manifest storage _manifest = manifests[manifestId];
        
        // Store info about this manifest
        _manifest.registrant = msg.sender;
        _manifest.name = name;
        _manifest.version = version;
        _manifest.index = registrantNameManifests[registrantNameIndex].length;
        _manifest.hashTypeName = hashTypeName;
        _manifest.checksum = checksum;
        _manifest.createdOn = now;
        
        registrantManifests[msg.sender].push(manifestId);
        registrantNameManifests[registrantNameIndex].push(manifestId);

	    emit LogManifest(msg.sender, name, version, hashTypeName, checksum);
	}
}