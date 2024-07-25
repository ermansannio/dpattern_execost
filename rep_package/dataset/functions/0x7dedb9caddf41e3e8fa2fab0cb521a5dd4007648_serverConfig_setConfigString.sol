contract serverConfig {
function setConfigString(string _newConfig) public ownerOnly {
        configString = _newConfig;
    }
}