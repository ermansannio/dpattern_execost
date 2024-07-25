contract AccreditationRegistryV1 {
function setAccreditationActive(
        bytes32 _provider, bytes32 _identifier, bool _active
    ) public onlyOwner onlyUnhalted {
        if (accreditations[_provider][_identifier] != _active) {
            accreditations[_provider][_identifier] = _active;
            emit AccreditationChange(_provider, _identifier, _active);
        }
    }
}